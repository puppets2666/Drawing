float angle = PI/4;

void setup()
{
  size(400, 400);
}

void draw()
{
  background(42);
  translate(200, height);
  branch(100);
  angle += 0.01;
}

void branch(float length)
{
  stroke(255);
  line(0, 0, 0, - length);
  translate(0, - length);
  
  if(length > 2)
  { 
    pushMatrix();
    rotate(angle);
    branch(length * 0.67);
    popMatrix();
    
    pushMatrix();
    rotate(-angle);
    branch(length * 0.67);
    popMatrix();
  }
}
