class Point
{
  // FIELDS
  private float x;
  private float y;
  // CONSTRUCTORS
  Point(Point p)
  {
    this.x = p.x;
    this.y = p.y;
  }
  Point(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  // METHODS
  float X() { return x; }
  float Y() { return y; }
}
