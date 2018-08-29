// http://benice-equation.blogspot.com/2013/01/binary-fractal-tree.html

float angle1 = radians(30);
float angle2 = radians(60);
float kLength1 = 0.65;
float kLength2 = 0.75;

void setup()
{
  size(500, 400);
}

void draw()
{
  background(0);
  translate(width/2, height);
  branch(100);
}
void keyPressed()
{  
  if(key == CODED && keyCode == RIGHT) 
  {
    angle1 += 0.01;
    angle2 += 0.01;
  }
  else if(key == CODED && keyCode == LEFT)
  {
    angle1 -= 0.01;
    angle2 -= 0.01;
  }
}
void branch(float length)
{
  if(length > 5) stroke(106, 19, 19);
  else stroke(34, 240, 35);
  
  line(0, 0, 0, - length);
  translate(0, - length);
  
  if(length > 2)
  { 
    pushMatrix();
    rotate(angle1);
    branch(length * kLength1);
    popMatrix();
    
    pushMatrix();
    rotate(-angle2);
    branch(length * kLength2);
    popMatrix();
  }
}
