class Box
{
  PVector position;
  float size;
  
  Box(float x, float y, float z, float size)
  {
    position = new PVector(x, y, z);
    this.size = size;
  }
  
  void show()
  {
    pushMatrix();
    translate(position.x, position.y, position.z);
    noStroke();
    fill(219, 206, 62);
    box(size);
    popMatrix();
  }
  
  ArrayList<Box> generate()
  {
    ArrayList<Box> boxes = new ArrayList(27);
    for (int i = -1; i < 2; ++i)
    {
      for (int j = -1; j < 2; ++j)
      {
        for (int k = -1; k < 2; ++k)
        {
          if (abs(i) + abs(j) + abs(k) > 1)// <= 1, also great result
          {
            float newSize = this.size / 3;
            // adding current location to oggset
            boxes.add(new Box(position.x + i * newSize, 
                              position.y + j * newSize,
                              position.z + k * newSize,
                              newSize));
          }
        }
      }
    }
    return boxes;
  }
}
