final PVector gravity = new PVector(0, 0.2);

Firework firework;

void setup()
{
  size(700, 500, P2D);
  
  colorMode(HSB);
  strokeWeight(4);
  
  firework = new Firework();
}

void draw()
{
  background(51);
  
  firework.update(gravity);
  firework.show();
}
