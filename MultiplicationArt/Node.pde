class Node
{
  float x;
  float y;
  
  Node(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void show(Node target)
  {
    noStroke();
    fill(node_color);
    ellipse(x, y, node_r, node_r);
    
    stroke(line_color);
    strokeWeight(line_weight);
    line(this.x, this.y, target.x, target.y);
  }
}