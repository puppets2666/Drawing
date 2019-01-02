final int starsAmount = 1000;

float speed = 1; // global

Star[] stars;

void setup()
{
  size(800, 800);
  stars = new Star[starsAmount];
  for(int i = 0; i < starsAmount; ++i)
  {
    stars[i] = new Star();
  }
  // star color
  fill(220,230,255);
  noStroke();
  // trace color
  stroke(255);
}
void draw()
{
  background(20);
  translate(width/2, height/2);
  
  for(int i = 0; i < starsAmount; ++i)
  {
    stars[i].update();
    stars[i].show();
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP) ++speed;
    else if (keyCode == DOWN) --speed;
    
    speed = constrain(speed, 1, 15);
  }
}
