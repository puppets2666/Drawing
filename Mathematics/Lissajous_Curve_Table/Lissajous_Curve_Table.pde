float angle = 0;
float speed = 0.01;
int circleWidth = 130; // 60

int cols;
int rows;
Curve[][] curves;
Circle[] horizontalCircles;
Circle[] verticalCircles;

void setup()
{
  size(800, 800, FX2D);
  
  float r = (circleWidth - 0.1*circleWidth)/2;
  
  // -1 cuz top left corner is empty
  cols = width / circleWidth - 1; 
  rows = height / circleWidth - 1;
  
  // verticalCircles
  verticalCircles = new Circle[cols];
  for (int j = 0; j < cols; ++j)
  {
    // calc center
    float cx = circleWidth+j*circleWidth + circleWidth/2;
    float cy = circleWidth/2;
    
    verticalCircles[j] = new Circle(cx, cy, r, j + 1, 
                                    color(random(100, 255), random(100, 255), random(100, 255)));
  }
  
  // horizontalCircles
  horizontalCircles = new Circle[rows];
  for (int i = 0; i < cols; ++i)
  {
    // calc center
    float cx = circleWidth/2;
    float cy = circleWidth+i*circleWidth + circleWidth/2;
    
    horizontalCircles[i] = new Circle(cx, cy, r, i + 1, 
                            color(random(100, 255), random(100, 255), random(100, 255)));
  }
  
  // curves matrix
  curves = new Curve[rows][cols];
  for (int j = 0; j < rows; ++j)
  {
    for (int i = 0; i < cols; ++i)
    {

      curves[j][i] = new Curve((int)floor(TWO_PI/speed), 
                           lerpColor(verticalCircles[i].getColor(), horizontalCircles[j].getColor(), 0.5));
    }
  }
}

void draw()
{
  background (0);

  // verticalCircles
  for (int j = 0; j < verticalCircles.length; ++j)
  {
      
    verticalCircles[j].show();
    verticalCircles[j].showVerticalLine();
    verticalCircles[j].showCurrentPoint();
    verticalCircles[j].update(angle);
    
    for (int i = 0; i < rows; ++i)
    {
      curves[j][i].setX(verticalCircles[j].pointX());
    }
  }
  // horizontalCircles
  for (int i = 0; i < horizontalCircles.length; ++i)
  {
      
    horizontalCircles[i].show();
    horizontalCircles[i].showHorizontalLine();
    horizontalCircles[i].showCurrentPoint();
    horizontalCircles[i].update(angle);
    
    for (int j = 0; j < cols; ++j)
    {
      curves[j][i].setY(horizontalCircles[i].pointY());
    }
  }
  
  // curves
  for (int j = 0; j < rows; ++j)
  {
    for (int i = 0; i < cols; ++i)
    {
      curves[j][i].confirmPoint();
      curves[j][i].show();      
    }
  }

  // new angle
  angle += speed;
}
