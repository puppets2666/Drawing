PImage[] images;
String[] filters;
int imageIndex;
int filterIndex;

void setup()
{
  size(600, 600);
  images = new PImage[] { loadImage("dog.jpg"), loadImage("flower.jpg"), loadImage("mountain.jpg") };
  filters = new String[] { "original", "junkie", "red green blue",
                           "rbg", "rg b*2", "grb", "bgr", "r g/2 b/10", 
                           "sepia", "negative", "vignette", "black&white", "brightness",
                           "threshold", "up down", "mirror", "saturation" };
  imageIndex = 0;
  filterIndex = 0;
}

void draw()
{
  // changing each pixel
  loadPixels();
  images[imageIndex].loadPixels();
  for (int x = 0; x < width; ++x)
  {
    for (int y = 0; y < height; ++y)
    {      
      // pixels is array, not matrix, should convert index
      int pixelIndex = x + y*width;
      // get pixel components separately
      float r = red (images[imageIndex].pixels[pixelIndex]);
      float g = green (images[imageIndex].pixels[pixelIndex]);
      float b = blue (images[imageIndex].pixels[pixelIndex]);
      float br = brightness (images[imageIndex].pixels[pixelIndex]);
      float s = saturation (images[imageIndex].pixels[pixelIndex]);
      
      switch (filterIndex)
      {
        default:
        case 0:// original
        {
          pixels[pixelIndex] = images[imageIndex].pixels[pixelIndex];
        };break;
        case 1:// junkie
        {
          pixels[pixelIndex] = images[imageIndex].pixels[pixelIndex]/2;
        };break;
        case 2:// red green blue
        {
          if ( x < width/2 && y < height /2)        pixels[pixelIndex] = color(r, g, b);
          else if ( x >= width/2 && y < height /2)  pixels[pixelIndex] = color(r, 0, 0);
          else if ( x < width/2 && y >= height /2)  pixels[pixelIndex] = color(0, g, 0);
          else if ( x >= width/2 && y >= height /2) pixels[pixelIndex] = color(0, 0, b);
        };break;
        case 3:// rbg
        {
          pixels[pixelIndex] = color(r, g, b);
        };break;
        case 4:// rg b*2
        {
          pixels[pixelIndex] = color(r, g, b*2);
        };break;
        case 5:// grb
        {
          pixels[pixelIndex] = color(g, r, b);
        };break;
        case 6:// bgr
        {
          pixels[pixelIndex] = color(b, g, r);
        };break;
        case 7:// r g/2 b/10
        {
          pixels[pixelIndex] = color(r, g/2, b/10);
        };break;
        case 8:// sepia
        {
          float tr = 0.393*r + 0.769*g + 0.189*b;
          float tg = 0.349*r + 0.686*g + 0.168*b;
          float tb = 0.272*r + 0.534*g + 0.131*b;          
                    
          pixels[pixelIndex] = color(tr > 255 ? 255 : tr, 
                                     tg > 255 ? 255 : tg,
                                     tb > 255 ? 255 : tb);
        };break;
        case 9:// negative
        {
          pixels[pixelIndex] = color(255 - r, 255 - g, 255 - b);
        };break;
        case 10:// vignette
        {
          float distance = dist(width/2, height/2, x, y);
          float factor = map(distance, 0, 500, 1, 0);
          pixels[pixelIndex] = color(r * factor, g * factor, b * factor);
        };break;
        case 11:// black&white
        {
          pixels[pixelIndex] = color((r+g+b)/3);
        };break;
        case 12:// brightness
        {
          pixels[pixelIndex] = color(br);
        };break;
        case 13:// threshold
        {
          pixels[pixelIndex] = br > 200 ? color(255) : color(0);
        };break;
        case 14:// up down
        {
          pixels[pixelIndex] = images[imageIndex].pixels[width*height - pixelIndex-1];
        };break;
        case 15:// mirror
        {
          pixels[pixelIndex] = images[imageIndex].pixels[height-1-x + y*width];
        };break;
        case 16:// saturation
        {
          pixels[pixelIndex] = color(s);
        };break;
      }
    }
  }
  updatePixels();
  
  // filter name
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(25);
  text(filters[filterIndex], width/2, 20);
}

void keyPressed()
{
  if (key == 'i') ++imageIndex;
  else if (key == 'I') --imageIndex;
  
  imageIndex %= images.length;
  imageIndex = abs(imageIndex);
  
  if (key == 'f') ++filterIndex;
  else if (key == 'F') --filterIndex;
  
  filterIndex %= filters.length;
  filterIndex = abs(filterIndex);
}
