class Star
{
  // FIELDS
  private float x;
  private float y;
  private float z;
  
  private float pz;
  // CONSTRUCTORS
  Star()
  {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width);
    
    pz = z;
  }
  // METHODS
  void update(float speed)
  {
    z -= speed;
    
    if (z < 1) reset();
  }
  void show()
  {
    // star    
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, width);

    float r = map(z, 0, width, 16, 0);
    
    fill(220,230,255);
    noStroke();
    ellipse(sx, sy, r, r);
    
    // trace
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    
    pz = z;
    
    stroke(255);
    line(px, py, sx, sy);
  }
  void reset()
  {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = width;
    
    pz = z;
  }
}
