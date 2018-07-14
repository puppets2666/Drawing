float alpha = 0.1;
int deep = 100;
int speed = 5;
Point A = new Point(100, 100); 
Point B = new Point(500, 100);
Point C = new Point(500, 500);
Point D = new Point(100, 500);
void setup()
{
  frameRate(speed);
  size(600, 600);
}
void draw()
{
  if (deep == 0) return;
  quad(A.x, A.y, B.x, B.y, C.x, C.y, D.x, D.y);
  Point T = A;// need to proper calculate D value

  A.x = nextPoint(A.x, B.x); A.y= nextPoint(A.y, B.y);
  B.x = nextPoint(B.x, C.x); B.y= nextPoint(B.y, C.y);
  C.x = nextPoint(C.x, D.x); C.y= nextPoint(C.y, D.y);
  D.x = nextPoint(D.x, T.x); D.y= nextPoint(D.y, T.y);
 
  --deep;
}
float nextPoint(float a, float b)
{
  return a *(1 - alpha)+ b * alpha;
}
class Point
{
  float x, y;
  Point(float x, float y)
  {
    this.x =x;
    this.y=y;
  }
}
