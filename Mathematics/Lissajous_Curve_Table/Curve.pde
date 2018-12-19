class Curve
{
  // FIELDS
  private Point[] path;
  private Point current;
  private int currentPointIndex;
  private color shapeColor;
  // CONSTRUCTORS
  Curve(int maxPointAmount, color shapeColor)
  {
    // show only 75% of point
    this.path = new Point[(int)floor(0.75 * maxPointAmount)];
    // allocate space, less checking in a future
    for (int i = 0; i < path.length; ++i) 
    {
      path[i] = new Point(-1, -1);
    }
    this.current = new Point(0, 0);
    this.currentPointIndex = 0;
    this.shapeColor = shapeColor;
  }
  
  // METHODS
  void setX(float x)
  {
    current.x = x;
  }
  void setY(float y)
  {
    current.y = y;
  }
  
  void confirmPoint()
  {
    path[currentPointIndex] = new Point(current);
    
    ++currentPointIndex;
    currentPointIndex %= path.length;    
  }
  void show()
  {
    noStroke();
    
    int alpha = 0;
    for (int i = currentPointIndex; i < currentPointIndex +  path.length; ++i)
    {
      // if (path[i] == null) break;// space is allocated, less checking
      
      int index = i % path.length;
      fill(shapeColor, ++alpha);      
      ellipse (path[index].X(), path[index].Y(), 1, 1);
    }
    
    strokeWeight(8);
    stroke(shapeColor);
    point(current.X(), current.Y());
  }
}
