float x;
float y;

void setup()
{
  size(600, 600);
  colorMode(HSB);
  background(0);
  
  x = 0;
  y = 0;
}


void nextPoint()
{
  float nextX;
  float nextY;
  float r = random(1);

  if (r < 0.01) // 1 stem
  {
    nextX =  0;
    nextY =  0.16 * y;
  } 
  else if ( r < 0.86) // 2 small leaflet
  {
    nextX =  0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.6;
  } 
  else if (r < 0.93) // 3 left-hand leaflet
  {
    nextX = 0.2  * x + -0.26 * y;
    nextY = 0.23 * x +  0.22 * y + 1.6;    
  } 
  else // 4 right-hand leaflet
  {
    nextX =  -0.15 * x + 0.28 * y;
    nextY =   0.26 * x + 0.24 * y + 0.44;
  }
  
  x = nextX;
  y = nextY;
}
void drawPoint()
{
  float px = map(x, -2.1820, 2.6558, 0, width);
  float py = map(y, 0, 9.9983, height, 0);
  
  stroke(py%256, 255, 255);
  strokeWeight(1); 
  point (px, py);
}
void draw()
{
  for (int i = 0; i < 25; ++i)
  {
    nextPoint();
    drawPoint();
  }
}
