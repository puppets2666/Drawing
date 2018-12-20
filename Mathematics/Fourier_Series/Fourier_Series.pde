float time;
float[] wave;

int maxN;
int circleSize;
int innerCircleSize;
float speed;
ArrayList<Integer> colors;

void setup()
{
  size(600, 400);
  colorMode(HSB);

  time = 0;
  wave = new float[200];
  // config
  maxN = 2;
  circleSize = 4;
  innerCircleSize = 2;
  speed = 0.05;
  colors = new ArrayList<Integer>(maxN);
  for(int i = 0; i < maxN; ++i)
  {
    colors.add(i, (int)random(0, 360));
  }
}

void draw()
{
  background(0);
  // config
  text("n = " + maxN + " (q;w)", 10, 20);
  text("global size = " + circleSize + " (a;s)", 10, 40);
  text("inner circle size = " + innerCircleSize + " (z;x)", 10, 60);
  text("speed = " + speed + " (e;r)", 10, 80);
  text("change color (c)", 10, 100);

  // act
  translate(200, 200);
  strokeWeight(2);

  float x = 0;
  float y = 0;

  // summing fourier series
  for (int i = 0; i < maxN; ++i)
  {
    float prevX = x;
    float prevY = y;

    float n = i*innerCircleSize + 1;
    float radius = 50*(circleSize/(n*PI));
    

    // smaller inner circles    
    stroke(colors.get(i), 255, 200, 200);
    noFill();
    ellipse(prevX, prevY, radius*2, radius*2);

    // summing up
    x += radius * cos(n * time);
    y += radius * sin(n * time);

    // dot on the cirlce
    ellipse(x, y, 2, 2);
    // line from the center to the point in a cirle
    line(prevX, prevY, x, y);
  }

  // shifting array and add new value to the beginnig
  System.arraycopy(wave, 0, wave, 1, wave.length - 1);  
  wave[0] = y;

  // line connecting the last circle and wave
  translate(200, 0);
  stroke(255);
  line(x - 200, y, 0, wave[0]);

  // wave
  stroke(colors.get(colors.size() - 1), 255, 200);
  noFill();
  beginShape();
  for (int i = 0; i < wave.length; ++i)
  {
    vertex(i, wave[i]);
  }
  endShape();

  // moving
  time += speed;
}

void keyPressed()
{
  // circle amount, adding colors for circle
  if (key == 'q')  
  {
    --maxN;
    
    colors.remove(colors.size() - 1);
  }
  else if (key == 'w') 
  {
    ++maxN;
    
    colors.add((int)random(0, 360));    
  }
  
  maxN = constrain(maxN, 1, 1000);
  
  // circle size
  if (key == 'a')  --circleSize;
  else if (key == 's') ++circleSize;  
  
  circleSize = constrain(circleSize, 1, 10);
  
  // inner circle size
  if (key == 'z')  --innerCircleSize;
  else if (key == 'x') ++innerCircleSize;  
  
  innerCircleSize = constrain(innerCircleSize, 0, 10);
  
  // inner circle size
  if (key == 'e')  speed-=0.01;
  else if (key == 'r') speed+=0.01;  
  
  speed = constrain(speed, 0.01, 0.1);
  
  // change all colors
  if (key == 'c') 
  {
    for(int i = 0; i < colors.size(); ++i)
    {
      colors.set(i, (int)random(0, 360));
    }
  }
  
}
