float x = 0;
float y = 0;
float space = 10;

void setup()
{
  size(400, 400);
  background(51);
  stroke(255);
}

void draw()
{
  if(random(1) < 0.5) line (x, y, x+space, y+space);
  else                line (x, y+space, x+space, y);
  
  x += space;
  if(x > width)
  {
    x = 0;
    y += space;
  }
  if(y > height) noLoop();
}
