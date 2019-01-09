ArrayList<Circle> circles;
PImage img;

void setup()
{
  size(236, 392); // image size
  ellipseMode(RADIUS);
  circles = new ArrayList<Circle>((236*392)/10);
  
  img = loadImage("rose.jpg");
}

void draw()
{
  background(51);
 
  for(int i = 0; i < 15; ++i)
  {
    addNewCircle(circles);
  }
  
  for(Circle circle : circles)
  {
    circle.show();
    circle.grow(circles);
  }

  // stop
  println(circles.size());
  if(circles.size() >= (236*392)/10)
  {
    noLoop();
    println("terminate condition");
  }
}

// get circle out other circle
void addNewCircle(ArrayList<Circle> circles)
{
  float x;
  float y;
  do
  {
    x = random(width);
    y = random(height);
  }while(!isValidPoint(x, y, circles));
  
  circles.add(new Circle(x, y, img.pixels[int(x) + int(y)*img.width]));
}

boolean isValidPoint(float x, float y, ArrayList<Circle> circles)
{
  for (Circle circle : circles)
  {
    if (circle.pointCollide(x, y))
    {
      return false;
    }
  }
  return true;
}
