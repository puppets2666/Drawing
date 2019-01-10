PImage img;

void setup()
{
  size(720, 960); // img size
  img = loadImage("img.jpg");
  img.loadPixels();
  noStroke();
  background(img);
}

void draw()
{
  for(int i = 0; i < 20; ++i)
  {
    int x = (int)random(img.width);
    int y = (int)random(img.height);
    int r = (int)random(10);
    
    fill(img.pixels[x + y*img.width]);
    ellipse(x, y, r, r);
  }
}
