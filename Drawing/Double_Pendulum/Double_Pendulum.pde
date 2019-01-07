// IMPORTS
import java.util.Queue; 
import java.util.ArrayDeque;

// CONST
final float gravity = 0.2;
final float damping = 0.9995;

// FIELDS
// rod length
float r1 = 100;
float r2 = 110;
// mass
float m1 = 20;
float m2 = 25;
// angle
float a1 = PI/2;
float a2 = -PI;
// velocity
float a1_v = 0;
float a2_v = 0;
// acceleration
float a1_a = 0;
float a2_a = 0;
// trace
Queue<ColorDote> trace;

void setup()
{
  size(600, 600, P2D);
  colorMode(HSB);
  trace = new ArrayDeque<ColorDote>();
}

void showParameters()
{
  fill(255);
  text("first rid length = " + r1, 10, 20);
  text("second rid length = " + r2, 10, 40);
  text("first mass = " + m1, 10, 60);
  text("second mass = " + m2, 10, 80);
}
void drawBob(float x, float y, float m)
{
  noStroke();
  fill(100);
  ellipse(x, y, m, m);
}

void drawTrace()
{
  noFill();
  strokeWeight(6);
  beginShape();
  for(ColorDote dot : trace)
  {
    stroke(130, dot.colorSaturation, 240, 225);
    vertex(dot.x, dot.y);
  }
  endShape();
}
void drawRod(float startX, float startY, float endX, float endY, float velocity)
{
  strokeWeight(4);
  stroke(map(velocity, -0.5, 0.5, 0, 360), 255, 255);
  line(startX, startY, endX, endY);
}
void draw()
{
  background(51);
  showParameters();  
  translate(width/2, height/2);
  
  // calc x, y for the bobs
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  trace.add(new ColorDote(x2, y2, map(a2_v , -0.5, 0.5, 20, 300)));
  
  // drawing
  drawTrace();
  // rod to first bob
  drawRod(0, 0, x1, y1, a1_v);
  // rod from first bob to second
  drawRod(x1, y1, x2, y2, a2_v);
  // middle point
  drawBob(0, 0, 20);
  // first bob
  drawBob(x1, y1, m1);
  // second bob
  drawBob(x2, y2, m2);
  
  // calc acceleration, anglem velocity, formulas are from the Internet
  a1_a = (-gravity * (2*m1+m2)*sin(a1) -m2 * gravity * sin(a1-2*a2) -2*sin(a1-a2)*m2*( pow(a2_v, 2) * r2 + pow(a1_v ,2)*r1*cos(a1 - a2)))  /  (r1*(2*m1+m2-m2*cos(2*a1-2*a2)));
  a2_a = (2*sin(a1-a2)*(pow(a1_v,2)*r1*(m1+m2)+gravity*(m1+m2)*cos(a1)+pow(a2_v,2)*r2*m2*cos(a1-a2))) / (r2*(2*m1+m2-m2*cos(2*a1-2*a2)));
  
  a1 += a1_v;
  a2 += a2_v;
  
  a1_v += a1_a;
  a2_v += a2_a;
  
  a1_v *= damping;
  a2_v *= damping;
  
  // remove old trace
  if(trace.size() > 200)trace.remove();  
}

void keyPressed()
{
  if(key == 'q')       r1+=10;
  else if (key == 'w') r1-=10;
  else if(key == 'e')  r2+=10;
  else if(key == 'r')  r2-=10;
  else if(key == 'a')  m1+=1;
  else if(key == 's')  m1-=1;
  else if(key == 'd')  m2+=1;
  else if(key == 'f')  m2-=2;
  
  r1 = constrain(r1, 50, 150);
  r2 = constrain(r2, 50, 150);
  
  m1 = constrain(m1, 5, 50);
  m2 = constrain(m2, 5, 50);
}
