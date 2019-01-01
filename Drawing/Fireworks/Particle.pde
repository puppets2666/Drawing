class Particle
{
  // CONST
  final int childAmount = 25;
  final int traceLength = 10;
  
  // FIELDS
  protected PVector position;
  protected PVector velocity;
  protected PVector acceleration;  
  
  protected PVector[] trace;
  
  protected float colorValue;
  protected float alpha;
  // CONSTRUCTORS
  Particle()
  {
    position = new PVector(random(width), height);
    velocity = new PVector(0, random(-15, -5));
    acceleration = new PVector(0, 0);
    
    trace = new PVector[traceLength];
    for (int i = 0; i < traceLength; ++i)
    {
      trace[i] = position.copy();
    }
    
    colorValue = random(0, 360);
    alpha = 255;
  }
  // METHODS
  protected void shiftTrace()
  {
    for(int i = trace.length - 1; i >= 1; --i)
    {
      trace[i] = trace[i-1];
    }
  }
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  void update()
  {
    shiftTrace();
    trace[0] = new PVector(position.x, position.y);
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0); // clean it up
  }
  void show()
  {    
    stroke(colorValue, 255, alpha);    
    point(this.position.x, this.position.y);
    
    for(int i = 0; i < trace.length; ++i)
    {
      stroke(colorValue, 255, 100);
      point(trace[i].x, trace[i].y);      
    }
  }
  boolean reachTopPoint()
  {
    return velocity.y >= 0;
  }
  Explosion[] explode()
  {
    Explosion[] child = new Explosion[childAmount];
    float randomExplodeMode = random(1);
    for( int i = 0; i < childAmount; ++i)
    {
      child[i] = new Explosion(i, this.position.x, this.position.y, this.colorValue, randomExplodeMode);
    }
    return child;
  }

}
