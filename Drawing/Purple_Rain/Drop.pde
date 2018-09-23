class Drop
{
  float x;
  float y;
  int dropLength;
  float speed;
  float gravity;
  float z;
  
  Drop(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.z = random(0, 20);
    this.dropLength = (int)map(z, 0, 20, 10, 20);
    this.speed = map(z, 0, 20, 1, 20);
    this.gravity = map(z, 0, 20, 0, 0.2);
  }
  void fall()
  {
    y += speed;
    speed += gravity;
    
    if (y > height)
    {
      this.y = random(-200, -50);
      this.speed = map(z, 0, 20, 1, 20);
    }
  }
  void show()
  {
    strokeWeight(map(z, 0, 20, 1, 3));
    stroke(138, 43, 226);
    line(x,y,x,y + dropLength);
  }
}
