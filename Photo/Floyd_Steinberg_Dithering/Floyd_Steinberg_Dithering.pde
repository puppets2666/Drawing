PImage[] images;
float factor;

void setup()
{
  size(912, 674);

  // 304*337
  images = new PImage[6];
  images[0] = loadImage("butterfly.jpg");
  images[2] = loadImage("butterfly.jpg");

  images[2].filter(GRAY);

  factor = 0;
}

void draw()
{
  // calc new images
  images[1] = mapImage(images[0], factor, false);  
  images[3] = mapImage(images[2], factor, false);  
  images[4] = mapImage(images[0], factor, true);  
  images[5] = mapImage(images[2], factor, true);

  drawImages();
  
  fill(255, 0, 0);
  textSize(20);
  text("factor = " + factor, 10, 20);
  text("without error calculation ", 304, 20);
  text("with error calculation", 608, 20);

  factor += 0.01;
  factor %= 255;
}

void drawImages()
{
  image(images[0], 0, 0);// original  
  image(images[1], 304, 0);// dithering without error
  image(images[2], 0, 337);// grayscale
  image(images[3], 304, 337);// grayscale dithering without error  
  image(images[4], 608, 0);// dithering with error
  image(images[5], 608, 337);// grayscale dithering with error
}

// pixels is array, not matrix, should convert index
int pixelIndex(PImage image, int x, int y)
{
  return x + y*image.width;
}

PImage mapImage(PImage image, float factor, boolean calcError)
{
  factor = abs(factor)%255 + 1;
  PImage clone = image.copy();  

  clone.loadPixels();
  for (int y = 0; y < clone.height; ++y)
  {
    for (int x = 0; x < clone.width; ++x)
    {
      color pixel = clone.pixels[pixelIndex(clone, x, y)];

      float oldR = red(pixel);
      float oldG = green(pixel);
      float oldB = blue(pixel);

      // old/255 get value from 0 to 1
      // multiply that value by a factor and round it, that is how many new colors we would have
      // 255/factor that is color multiplier
      float newR = round(factor * oldR/255) * 255/factor;
      float newG = round(factor * oldG/255) * 255/factor;
      float newB = round(factor * oldB/255) * 255/factor;     

      clone.pixels[pixelIndex(clone, x, y)] = color(newR, newG, newB);
      
      if (calcError)
      {
          float[] errorRGB = new float[] 
          {
            oldR - newR,
            oldG - newG,
            oldB - newB
          };
      
          if (isValidIndex(clone, x+1, y))
            clone.pixels[pixelIndex(clone, x+1, y)] = ditherColor(clone.pixels[pixelIndex(clone, x+1, y)], errorRGB, 7/16.0);      
          if (isValidIndex(clone, x-1, y+1))
            clone.pixels[pixelIndex(clone, x-1, y+1)] = ditherColor(clone.pixels[pixelIndex(clone, x-1, y+1)], errorRGB, 3/16.0);
          if (isValidIndex(clone, x, y+1))
            clone.pixels[pixelIndex(clone, x, y+1)] = ditherColor(clone.pixels[pixelIndex(clone, x, y+1)], errorRGB, 5/16.0);
          if (isValidIndex(clone, x+1, y+1))
            clone.pixels[pixelIndex(clone, x+1, y+1)] = ditherColor(clone.pixels[pixelIndex(clone, x+1, y+1)], errorRGB, 1/16.0);
      }
    }
  }
  clone.updatePixels();

  return clone;
}

color ditherColor(color currentColor, float[] errorRGB, float factor)
{
  float r = red(currentColor);
  float g = green(currentColor);
  float b = blue(currentColor);
  
  r += errorRGB[0] * factor;
  g += errorRGB[1] * factor;
  b += errorRGB[2] * factor;
  
  return color(r, g, b);
}
boolean isValidIndex(PImage img, int x, int y)
{
  return x < img.width && x > 0 && y < img.height && y > 0;  
}
