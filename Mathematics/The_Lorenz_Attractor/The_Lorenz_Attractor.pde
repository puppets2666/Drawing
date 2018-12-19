// IMPORT
import peasy.*;
// CONST
final float a = 10;
final float b = 28;
final float c = 8/3;

float x = 0.01;
float y = 0;
float z = 0;

ArrayList<PVector> points;

PeasyCam cam;

void setup()
{
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  points = new ArrayList<PVector>();
}
void draw()
{
  background(0);
  
  float dt = 0.01;
  
  float dx = a * (y - x);       dx *= dt;
  float dy = x * (b - z) - y;   dy *= dt;
  float dz = x * y - c * z;     dz *= dt;
  
  x += dx;
  y += dy;
  z += dz;  
  
  points.add(new PVector(x, y, z));
  
  
  // drawing

  translate(0, 0, -80);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  for (PVector point : points)
  {
    stroke(hu, 255, 255);
    point(point.x, point.y, point.z);
    
    hu += 0.1;
    hu %= 255;
  }  
}
