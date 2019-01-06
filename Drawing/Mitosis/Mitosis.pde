ArrayList<Cell> cells;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  ellipseMode(RADIUS);
  cells = new ArrayList<Cell>();
  cells.add(new Cell());
}
void draw()
{
  background(215);
  
  if(random(1) < 0.001) cells.add(new Cell());// sometimes add new Cell
  
  for (Cell cell : cells)
  {
    cell.update();
    cell.show();
  }
}

void mousePressed()
{
  for(int i = 0; i < cells.size(); ++i)
  {
    if(cells.get(i).clicked(mouseX, mouseY))
    {
      // add children
      int childrenAmount = floor(random(2, 5));
      Cell[] children = cells.get(i).split(childrenAmount);
      for(int j = 0; j < childrenAmount; ++j)
      {
        cells.add(children[j]);
      }
      // remove parent
      cells.remove(i);
      break;
    }
  }
}
