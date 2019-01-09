class Circle
{
  // FIELDS
  private float x;
  private float y;
  private float radius;
  private boolean isGrowing;
  private color colorValue;
  // CONSTRUCTORS
  Circle(float x, float y, color colorValue)
  {
    this.x = x;
    this.y = y;
    this.radius = 1;
    this.colorValue = colorValue;
    this.isGrowing = true;
  }
  // METHODS
  
  void show()
  {
    noStroke();
    fill(colorValue);
    ellipse(x, y, radius, radius);
  }
  void grow(ArrayList<Circle> circles)
  {
    if (isGrowing) 
    {
      // grow
      radius += 0.5;
      
      // check if can grow bigger      
      
      // check if out edges
      isGrowing = !edges();
      // check if collided with another circles
      for(Circle circle : circles)
      {
        if (this != circle &&     // skip checking with itself
            circleCollide(circle)) 
        {
           isGrowing = false;
           break;
        }
      }
    }
  }
  boolean edges()
  {
    return x + radius > width  || // right edge
           x - radius < 0      || // left edge
           y + radius > height || // bottom
           y - radius < 0;        // top
  }
  boolean circleCollide(Circle c)
  {
    return sqrt(pow(this.x - c.x, 2) + pow(this.y - c.y, 2)) < this.radius + c.radius;
  }
  boolean pointCollide(float x, float y)
  {
    return sqrt(pow(this.x - x, 2) + pow(this.y - y, 2)) < radius;
  }
}
