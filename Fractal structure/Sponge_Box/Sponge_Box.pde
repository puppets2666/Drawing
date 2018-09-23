ArrayList<Box> boxes;
float xAngleRotate;
float yAngleRotate;

void setup()
{
  size(400, 400, P3D);
  
  boxes = new ArrayList<Box>();
  boxes.add(new Box(0, 0, 0, 200));
  xAngleRotate = 0;
  yAngleRotate = 0;
}
void draw()
{
  background(51);
  stroke(255);
  lights();
  
  if (keyPressed && key == CODED)
  {
    if (keyCode == LEFT) yAngleRotate -= 0.01;
    else if (keyCode == RIGHT) yAngleRotate += 0.01;
    
    if (keyCode == UP) xAngleRotate += 0.01;
    else if (keyCode == DOWN) xAngleRotate -= 0.01;
  }
  
  translate(width/2, height/2);
  rotateX(xAngleRotate);
  rotateY(yAngleRotate);
  
  for(Box box : boxes)
  {
    box.show();
  }
}
void mousePressed()
{
  ArrayList<Box> next = new ArrayList<Box>(27 * boxes.size());
  for (Box box: boxes)
  {
    next.addAll(box.generate());
  }
  boxes = next;
}
