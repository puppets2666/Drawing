final int scale = 20;
final int w = 1000;
final int h = 800;

int cols;
int rows;

float flying;

void setup()
{
  size(600, 600, P3D);
  colorMode(HSB);
  cols = w / scale;
  rows = h / scale;
  flying = 0;
}
void draw()
{
  background(0);  
  
  translate(width/2, height/2);
  rotateX(PI/3);  
  translate(-w/2, -h/2);
  
  noFill();
  
  float yoff = flying;
  for (int y = 0; y < rows-1; ++y)
  {
    float xoff = 0;
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; ++x)
    {
      float z = map(noise(xoff, yoff), 0, 1, -100, 100);
      stroke(color(map(z, -100, 100, 0, 360), 255, 200));
      
      // drawing triangle
      vertex(x*scale, y*scale, z);
      vertex(x*scale, (y+1)*scale, z);      
      
      xoff += 0.1;
    }
    yoff += 0.1;
    endShape();
  }
  
  flying -=0.02;
}
