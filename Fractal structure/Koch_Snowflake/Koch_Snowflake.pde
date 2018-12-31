ArrayList<Segment> segments;
int i;

void setup()
{
  size(600, 600);
  segments = new ArrayList<Segment> ();
  i = 0;
  
  PVector leftPoint = new PVector(100, 200);
  PVector rightPoint = new PVector(500, 200);
  PVector bottomPoint = new PVector(300, 500);
  
  Segment s1 = new Segment(bottomPoint, leftPoint);
  Segment s2 = new Segment(leftPoint, rightPoint);
  Segment s3 = new Segment(rightPoint, bottomPoint);
  
  segments.add(s1);
  segments.add(s2);
  segments.add(s3);
}

void draw()
{
  background(0);
  
  fill(255);
  text(i, 10, 20);
  
  for (Segment segment: segments)
  {
    segment.show();
  }
}

void mousePressed()
{
  ArrayList<Segment> nextGeneration = new ArrayList<Segment>(segments.size() * 4);
  for (Segment segment: segments)
  {
    Segment[] child = segment.generate();
    for (Segment c : child)  nextGeneration.add(c);
  }
  segments = nextGeneration;
  ++i;
}
