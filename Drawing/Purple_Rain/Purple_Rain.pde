Drop[] drops;
int dropsAmount;

void setup()
{
  size(640, 360);
  dropsAmount = 200;
  drops = new Drop[dropsAmount];
  for (int i = 0; i < dropsAmount; ++i)
  {
    drops[i] = new Drop(random(width), random(-200, -50));
  }
}
void draw()
{
  background(230, 230, 250);
  for (int i = 0; i < dropsAmount; ++i)
  {
    drops[i].fall();
    drops[i].show();
  }
}
