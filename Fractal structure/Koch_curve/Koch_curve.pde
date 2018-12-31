int i = 0;

void setup()
{
  size(600, 250);
}

void draw()
{
  background(0);
  
  stroke(255);
  text(i, 10, 20);

  recursion(i, 0, 200, 600, 200 );
}

void recursion(int i, float x1, float y1, float x2, float y2)
{
  if (i == 0) 
  {
    stroke(255);
    line(x1, y1, x2, y2);
    return;
  }

  float alpha = atan2(y2 - y1, x2 - x1);
  float r = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));// point distance

  // left point
  float xa = x1 + r * cos(alpha) / 3;
  float ya = y1 + r * sin(alpha) / 3;

  // middle point
  float xc = xa + r * cos(alpha - PI / 3) / 3;
  float yc = ya + r * sin(alpha - PI / 3) / 3;

  // right poiny
  float xb = x1 + 2 * r * cos(alpha) / 3;
  float yb = y1 + 2 * r * sin(alpha) / 3;

  recursion(i - 1, x1, y1, xa, ya);
  recursion(i - 1, xa, ya, xc, yc);
  recursion(i - 1, xc, yc, xb, yb);
  recursion(i - 1, xb, yb, x2, y2);
}

void mousePressed()
{
  ++i;
}
