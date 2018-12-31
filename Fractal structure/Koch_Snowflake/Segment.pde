class Segment
{
  // FIELDS
  PVector start;
  PVector end;
  // CONSTRUCTOR
  Segment(PVector start, PVector end)
  {
    this.start = start.copy();
    this.end = end.copy();
  }
  // METHODS
  Segment[] generate()
  {    
    Segment[] children = new Segment[4];
    
    PVector v = PVector.sub(end, start);
    v.div(3);
    
    // left side
    PVector ls = PVector.add(start, v);
    children[0] = new Segment(start, ls);
    
    // right side
    PVector rs = PVector.sub(end, v);
    children[3] = new Segment(rs, end);
    
    // triangle
    v.rotate(-PI/3);
    PVector m = PVector.add(ls, v);
    children[1] = new Segment(ls, m);
    children[2] = new Segment(m, rs);
    
    return children;
    
  }
  void show()
  {
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
}
