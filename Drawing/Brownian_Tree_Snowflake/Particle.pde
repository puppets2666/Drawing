class Particle
{
  // FIELDS
  private float x;
  private float y;
  private float radius;
  // CONSTRUCTORS
  Particle(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.radius = 3;
  }
  // METHODS
  void show()
  {
    if(colorMode)fill(map(x, 0, width,110, 300), 255, 255);
    else fill(255);
    ellipse(x, y, radius, radius);
  }
  void update(int route)
  {
    --x;    
    y += random(-route, route);
  }
  boolean finished()
  {
    return x < 0;
  }
  boolean intersects(ArrayList<Particle> snowflake)
  {
    for (Particle s : snowflake)
    {
      if(dist(s.x, s.y, x,y) < radius*distCoef) return true;
    }
    return false;
  }
}
