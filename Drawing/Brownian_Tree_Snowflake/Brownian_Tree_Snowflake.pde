int route = 5;
int distCoef = 5;
boolean colorMode = false;

Particle current;
Snowlake snowflake;

void setup()
{
  size(600, 600);
  ellipseMode(RADIUS);
  colorMode(HSB);
  noStroke();
  current = new Particle(width/2, random(0, 10));
  snowflake = new Snowlake();
}

void draw()
{
  background(51);
  showText();
  translate(width/2, height/2);
  rotate(PI/6);
  
  while(!current.finished() && !current.intersects(snowflake.snowflake))
  {
    current.update(route);
  }
  current.show();

  if(current.finished() || current.intersects(snowflake.snowflake))
  {
    snowflake.add(current);
    current = new Particle(width/2, 0);
  }
  
  snowflake.show();
}

void mousePressed()
{
  snowflake.clear();
}

void keyPressed()
{
  if(key == 'q') ++route;
  else if(key == 'w') --route;
  else if(key == 'a') ++distCoef;
  else if(key == 's') --distCoef;
  else if(key == 'c') colorMode = !colorMode;
  
  route = constrain(route, 1, 10);
  distCoef = constrain(distCoef, 1, 10);
}

void showText()
{
  fill(255);
  text("route random value = " + route, 10, 20);  
  text("particle distance coefficient = " + distCoef, 10, 40);
  text("color mode = " + (colorMode ? "on" : "off"), 10, 60);
}
