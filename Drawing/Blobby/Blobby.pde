float radius = 200;

float x;
float y;

float yoff = 0;

void setup()
{
  size(600, 600);
  
  x = width/2;
  y = height/2;
  
};
void draw()
{
  background(51);
  beginShape();
  float xoff = 0;
  for(float a = 0; a < TWO_PI; a += 0.1)
  {
    // float offset = random(-5, 5);
    // float offset = map(sin(a*10 + frameCount*0.1), -1, 1, -10, 10);
    float offset = map(noise(xoff, yoff), 0, 1, -15, 15);
    
    float r = radius + offset;
    float vertexX = r * cos(a) + x;
    float vertexY = r * sin(a) + y;
    
    vertex(vertexX, vertexY);
    xoff += 0.1;
  }  
  endShape();
  yoff += 0.1;
}
