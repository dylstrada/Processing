import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Box b;
ArrayList<Box> sponge;
PFont HUL;
PeasyCam cam;
int iterations = 0;

void setup()
{
  size(800, 800, P3D);
  b = new Box(0, 0, 0, 200);
  sponge = new ArrayList<Box>();
  sponge.add(b);
  HUL = loadFont("HUL.vlw");
  cam = new PeasyCam(this, 200, 400, 0, 700);
}

void draw()
{
  background(220);
  fill(0);
  textFont(HUL, 30);
  textAlign(CENTER);
  if (iterations < 3)
  {
    text("MENGER SPONGE \n Level: " + iterations, 200, 200);
  }
  if (iterations == 3)
  {
    text("MENGER SPONGE \n Level: MAX", 200, 200);
  }
  text("Press any key \n to generate fractal. \n Click and drag to \n rotate view.", 200, 600);
  stroke(255);
  noFill();
  spotLight(255, 255, 255, 0, 0, 0, 100, 100, 0, PI/4, 1);
  
  translate(200, 400);
  for (Box b : sponge)
  {
    b.show();
  }
}

void keyPressed()
{
  if (iterations < 3)
  {
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge)
    {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    sponge = next;
    iterations++;
  }
}