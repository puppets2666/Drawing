final float increment = 0.005;
PGraphics buffer1;
PGraphics buffer2;
PImage cooling;
float ystart;

void setup() 
{
  size(600, 400);
  buffer1 = createGraphics(width, height);
  buffer2 = createGraphics(width, height);
  cooling = createImage(width, height, RGB);
  ystart = 0.0;
}

void cool() 
{
  cooling.loadPixels();
  float xoff = 0.0; 
  
  for (int x = 0; x < width; ++x) 
  {
    xoff += increment;   
    float yoff = ystart;   
    for (int y = 0; y < height; ++y) 
    {
      yoff += increment; 
      cooling.pixels[x+y*width] = color(pow(noise(xoff, yoff), 3) * 255);
    }
  }
  cooling.updatePixels();
  ystart += increment;
}

void fire(int rows) 
{
  buffer1.beginDraw();
  buffer1.loadPixels();
  for (int x = 0; x < width; ++x) 
  {
    for (int j = 0; j < rows; ++j) 
    {
      int y = height-(j+1);
      int index = x + y * width;
      buffer1.pixels[index] = color(255, 20, 0);
    }
  }
  buffer1.updatePixels();
  buffer1.endDraw();
}

void draw() 
{
  fire(5);
  cool(); 
  
  buffer2.beginDraw();
  buffer1.loadPixels();
  buffer2.loadPixels();
  for (int x = 1; x < width-1; ++x) 
  {
    for (int y = 1; y < height-1; ++y) 
    {
      float newC = (brightness(buffer1.pixels[(x+1) + y* width]) + // add the neighbour 
                    brightness(buffer1.pixels[(x-1) + y*width])  + // of previous buffer
                    brightness(buffer1.pixels[x + (y+1)*width])  + // and subtract cooling cell
                    brightness(buffer1.pixels[x + (y-1)*width])) /4 - brightness(cooling.pixels[x + y*width]);

      buffer2.pixels[(x) + (y-1) * width] = color(newC, 20, 0);
    }
  }
  buffer2.updatePixels();
  buffer2.endDraw();

  // Swap
  PGraphics temp = buffer1;
  buffer1 = buffer2;
  buffer2 = temp;
  
  // show buffer1
  background(buffer1);
}

void mouseDragged()
{
  buffer1.beginDraw();
  buffer1.fill(255, 20, 0);
  buffer1.noStroke();
  buffer1.ellipse(mouseX, mouseY, 60, 60); 
  buffer1.endDraw();
}
