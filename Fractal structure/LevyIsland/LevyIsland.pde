int deepness = 15;

void setup()
{
  size(600, 500, FX2D);
  noLoop();
}

void draw()
{
  background(250);
  
  fill(0);
  text("deepness - " + deepness, 20, 20);
  
  LevyCurve(250, 400, 160, 160, deepness); // build Levy's Curve
  LevyCurve(400, 400, 160, 310, deepness); // on each
  LevyCurve(400, 250, 310, 310, deepness); // side of the 
  LevyCurve(250, 250, 310, 160, deepness); // square
}

void LevyCurve(int x1, int x2, int y1, int y2, int deepness)
{
  if (deepness == 0)
  {
    line(x1, y1, x2, y2);
  } 
  else
  {
    int x3 = (x1 + x2) / 2 + (y2 - y1) / 2;
    int y3 = (y1 + y2) / 2 - (x2 - x1) / 2;

    LevyCurve(x1, x3, y1, y3, deepness - 1);
    LevyCurve(x3, x2, y3, y2, deepness - 1);
  }
}
void keyPressed()
{  
  if (key == CODED && keyCode == RIGHT && deepness < 15) 
  {
    ++ deepness;
  } 
  else if (key == CODED && keyCode == LEFT && deepness > 0)
  {
    -- deepness;
  }
  redraw();
}
