float rotate = 0;
float rotateSpeed = 0.06;
void setup()
{
  size(400, 400);
}

void draw()
{
  background(42);
  translate(width/2, height/2);
  // head and body
  stroke(255);
  fill(255);
  ellipse(0, 0, 15, 75);
  ellipse(0, -35, 10, 10);
  // wings
  rotate(HALF_PI);
  stroke(255);
  strokeWeight(2);
  fill(25);
  
  float xoff =  0;
  beginShape();
  for(float a = -HALF_PI; a < HALF_PI + PI; a += 0.03)
  {
    float r = sin(2*a) * map(noise(xoff), 0, 1, 50, 125);    
    vertex(r * cos(a), sin(rotate) * r * sin(a));
    
    xoff += a < HALF_PI ? 0.1: -0.1;
  }
  endShape();
  rotate += rotateSpeed;
}
