int n;
final int c = 5;// scaling factor

void setup()
{
  size(400, 400);
  background(0);
  colorMode(HSB);
  n = 0;  
}

void draw()
{
  float angle = n * 137.5; // 137.3, 137.6
  float radius = c * sqrt(n);
  
  float x = radius * cos(angle) + width/2;
  float y = radius * sin(angle) + height/2;
  
  noStroke();
  fill(n%256, 255, 255);// angle % 256
  ellipse(x, y, c, c);
  
  ++n;
}
