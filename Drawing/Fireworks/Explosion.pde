class Explosion extends Particle
{
  // CONSTRUCTORS
  private Explosion(int num, float x, float y, float colorValue, float randomExplodeMode)
  {
    position = new PVector(x, y);
    acceleration = new PVector(0, 0);
    
    if (randomExplodeMode < 0.25) // random
    {
      velocity = new PVector(random(-5, 5), random(-5, 5));
    }
    else if (randomExplodeMode < 0.5) // circle
    {
      velocity = PVector.random2D(); 
      velocity.mult(4); 
    } 
    else if (randomExplodeMode < 0.75)// heart
    {
      x = 8*pow(sin(num), 3);
      y = -(6.5*cos(num) - 5*cos(2*num) -2*cos(3*num) - cos(4*num));
      
      velocity = new PVector(x, y);
    }
    else // star
    {
      x = 5*pow(cos(num), 3);
      y = -5*pow(sin(num), 3);      
      
      velocity = new PVector(x, y);
    }
    
    trace = new PVector[traceLength/3];
    for (int i = 0; i < traceLength/3; ++i)
    {
      trace[i] = position.copy();
    }
    
    this.colorValue = colorValue;
    alpha = 255;
  }
  // METHODS
  void update()
  {
    slowDown();
    super.update();
    fadeOut();
  }
  private void slowDown()
  {
    velocity.mult(0.9);
  }
  private void fadeOut()
  {
    alpha -= 4;
  }
  boolean outOfScreen()
  {
    return alpha <= 100;
  }
}
