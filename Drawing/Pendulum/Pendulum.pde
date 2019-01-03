SinglePendulum pendulum;

void setup()
{
  size(640, 360);
  ellipseMode(RADIUS);
  
  pendulum = new SinglePendulum();  
}

void draw()
{
  background(51);
  
  pendulum.update(); 
  pendulum.show();
  pendulum.click(mouseX, mouseY);
}
