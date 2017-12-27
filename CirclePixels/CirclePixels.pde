ArrayList<Circle> circles;
PImage img;

void setup()
{
  size(560, 425);
  img = loadImage("future.jpg");
  img.resize(width, height);
  img.loadPixels();
  circles = new ArrayList<Circle>();
}

void draw()
{
  background(0);
  
  int total = 20;
  int count = 0;
  int attempts = 0;
  
  while (count < total){
    Circle newC = newCircle();
    if (newC != null) {
      circles.add(newC);
      count++;
    }
    attempts++;
    if (attempts > 500) {
      noLoop();
      println("done");
      break;
    }
  }
  
  for (Circle c : circles) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Circle other : circles) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            if (d < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle newCircle()
{
  float x = random(width);
  float y = random(height);
  
  boolean valid = true;
  for (Circle c : circles)
  {
    float d = dist(x, y, c.x, c.y);
    if (d < c.r)
    {
      valid = false;
      break;
    }
  }
  if (valid)
  {
    int index = int(x) + int(y) * img.width;
    color col = img.pixels[index];
    float b = brightness(img.pixels[index]);
    float i = b/1000;
    return new Circle(x,y, col, i);
  }
  else
  {
    return null;
  }
}