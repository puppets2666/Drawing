class Circle
{
  // FIELDS
  private float centerX;
  private float centerY;

  private float radius;
  private float speed;

  private float pointX;
  private float pointY;
  
  private color circleColor;
  // CONSTRUCTORS
  Circle (float centerX, float centerY, float radius, float speed, color circleColor)
  {
    this.centerX = centerX;
    this.centerY = centerY;

    this.radius = radius;
    this.speed = speed;

    this.pointX = radius * cos(HALF_PI);
    this.pointY = radius * sin(HALF_PI);
    
    this.circleColor = circleColor;
  }

  // METHODS
  void update(float angle)
  {
    this.pointX = radius * cos(angle * speed - HALF_PI);
    this.pointY = radius * sin(angle * speed - HALF_PI);
  }
  void show()
  {
    noFill();
    stroke(circleColor);
    strokeWeight(4);
    ellipseMode(RADIUS);
    ellipse (centerX, centerY, radius, radius);
  }
  void showCurrentPoint()
  {
    stroke(circleColor);
    strokeWeight(1);
    fill(255);
    ellipse(pointX(), pointY(), 0.1*radius, 0.1*radius);
  }
  void showVerticalLine()
  {
    stroke (circleColor, 100);
    strokeWeight(0.1*radius);
    line(pointX(), 0, pointX(), height);
  }
  void showHorizontalLine()
  {
    stroke (circleColor, 100);
    strokeWeight(0.1*radius);
    line(0, pointY(), width, pointY());
  }
  // PROPERTIES
  color getColor() { return circleColor; }
  float pointX() { return centerX + pointX; }
  float pointY() { return centerY + pointY; }
}
