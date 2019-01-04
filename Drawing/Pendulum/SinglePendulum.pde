class SinglePendulum
{
  // CONST
  private final float gravity = 0.2;
  private final float damping = 0.99;// slow pendulum on 1%
  
  // FIELDS
  private PVector origin;
  private PVector bob;
  private float armLength;
  private float bobSize;
  private float bobWeight;
  
  private float angle;
  private float angleVelocity;
  private float angleAcceleration;
  
  private boolean isDragging;
  // CONSTRUCTORS
  SinglePendulum(float armLength, float xPosition, float size)
  {
    this.armLength = armLength;
    origin = new PVector(xPosition, 0);
    bob = new PVector(width/2, armLength);
    bobSize = size;
    bobWeight = bobSize / 4;
    
    angle = HALF_PI;
    angleVelocity = 0;
    angleAcceleration = 0;
    
    isDragging = false;
  }
  SinglePendulum()
  {
    this(height/2, width/2, 16);
  }
  // METHODS
  void update()
  {    
    bob.x = origin.x + armLength * sin(angle);
    bob.y = origin.y + armLength * cos(angle);
    
    if (!isDragging)
    {
      
      angleAcceleration = (-1*gravity*bobWeight / armLength) * sin(angle);
      
      angle += angleVelocity;
      angleVelocity += angleAcceleration;
      
      angleVelocity *= damping;
    }
    else
    {      
      angle = -asin(constrain(origin.x - mouseX, -armLength, armLength)/armLength); 
      angleVelocity = 0;
      angleAcceleration = 0;
    }
  }
  void show()
  {
    // arm
    stroke(255,248,220);
    strokeWeight(2);
    line(origin.x, origin.y, bob.x, bob.y);
    
    // bob
    if(isDragging) stroke(255, 0, 0);
    else stroke(0);
    ellipse(bob.x, bob.y, bobSize, bobSize);
  }
  void click(float x, float y)
  {
    isDragging = mousePressed && sqrt(pow(x - bob.x, 2) + pow(y - bob.y, 2)) < bobSize;
  }
}
