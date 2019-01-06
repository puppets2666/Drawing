class Cell
{
  // FIELDS
  private PVector position;
  private float radius;
  private float colorValue;
  // CONSTRUCTORS
  Cell()
  {
    this(random(width), random(height), random(50, 100), random(360));
  }
  Cell(float x, float y, float r, float c)
  {
    position = new PVector(x, y);
    radius = r;
    colorValue = c;
  }
  // METHODS
  void update()
  {
    PVector velocity = PVector.random2D();
    position.add(velocity);
    position.x = constrain(position.x, 0, width);
    position.y = constrain(position.y, 0, height);
  }
  void show()
  {
    fill(colorValue, 255, 255, 100);
    stroke(colorValue, 255, 255);
    strokeWeight(2);
    ellipse(position.x, position.y, radius, radius);
  }
  boolean clicked(float x, float y)
  {
    return dist(position.x, position.y, x, y) < radius;
  }
  private Cell children()
  {
    return new Cell(position.x + random(-radius, radius), 
                    position.y + random(-radius, radius), 
                    radius * 0.8, 
                    colorValue * 0.9);
  }
  Cell[] split(int amount)
  {
    Cell[] cells = new Cell[amount];
    for (int i = 0; i < amount; ++i)
    {
      cells[i] = children();
    }
    return cells;
  }
}
