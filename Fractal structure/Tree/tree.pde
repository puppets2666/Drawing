// http://benice-equation.blogspot.com/2013/01/binary-fractal-tree.html

float angle = PI/4;

void setup()
{
  size(400, 400);
}

void draw()
{
  background(0);
  translate(200, height);
  branch(100);
}
void keyPressed()
{  
  if(key == CODED && keyCode == RIGHT) angle += 0.01;
  else if(key == CODED && keyCode == LEFT) angle -= 0.01;
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
    rotate(angle);
    branch(length * 0.67);
    popMatrix();
    
    pushMatrix();
    rotate(-angle);
    branch(length * 0.67);
    popMatrix();
  }
}
