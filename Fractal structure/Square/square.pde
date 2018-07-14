float alpha = 0.1;
void setup()
{
  size(600,600);
  buildFract(new Point(100,100),new Point(500,100),new Point(500,500), new Point(100,500),100);
}
void buildFract(Point A,Point B, Point C, Point D, int deep)
{
  if(deep == 0) return;
  else
  {
    Point A1 = new Point(A.x *(1 - alpha)+ B.x * alpha, A.y *(1 - alpha) + B.y * alpha);
    Point B1 = new Point(B.x *(1 - alpha)+ C.x * alpha, B.y *(1 - alpha) + C.y * alpha);
    Point C1 = new Point(C.x *(1 - alpha)+ D.x * alpha, C.y *(1 - alpha) + D.y * alpha);
    Point D1 = new Point(D.x *(1 - alpha)+ A.x * alpha, D.y *(1 - alpha) + A.y * alpha);
    quad(A.x,A.y,B.x,B.y,C.x,C.y,D.x,D.y);
    Fractorial(A1, B1, C1, D1, --deep);
  }
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
