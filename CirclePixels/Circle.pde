class Circle
{
  float x;
  float y;
  float r;
  color c;
  float inc;
  
  boolean growing = true;
  
  Circle(float x_, float y_, color c_, float inc_)
  {
    this.x = x_;
    this.y = y_;
    this.c = c_;
    this.inc = inc_;
    r = 1;
  }
  
  void show()
  {
    fill(c);
    noStroke();
    //stroke(255);
    ellipse(x, y, r*2, r*2);
  }
  
  void grow()
  {
    if (growing)
    {
      r += inc;
    }
  }
  
  boolean edges()
  {
    return (x + r > width - 2 || x - r < 2 
    || y + r > height - 2 || y - r < 2);
  }
}