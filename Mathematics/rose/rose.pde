float d = 8;
float n = 5;

void setup()
{
  size(400, 400);  
}
void draw()
{
  background(51);
  fill(255);
  text("d = " + d + "  n = " + n, 10, 10);
  translate(width/2, height/2);

  stroke(255);
  noFill();
  beginShape();
  for(float a = 0; a < TWO_PI * d; a += 0.01)
  {
    float r = 150 * cos(n/d * a);
    
    vertex(r * cos(a), r * sin(a));
  }
  endShape(CLOSE);
}
void keyPressed()
{
  if (key == 'q') -- d;
  else if (key == 'e') ++ d;
  else if (key == 'a') -- n;
  else if (key == 'd') ++ n;
}
