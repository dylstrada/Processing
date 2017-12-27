//Mathematical properties
int num_nodes = 360;
int factor = 0;
int max_connections = 360;
int radius = 402;

//Artistic properties
float node_r = 2;
int node_color = color(255);
int line_color = color(255, 100);
int line_weight = 1;

//Initializations
ArrayList<Node> nodes;

void setup()
{
  size(1000, 1000);
  nodes = new ArrayList<Node>();
  for (float angle = 0.0; angle < 2 * PI; angle += (2 * PI)/num_nodes)
  {
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    Node new_node = new Node(x, y);
    nodes.add(new_node);
  }
}

void draw()
{
  background(36, 52, 89);
  textAlign(CENTER);
  textSize(48);
  text("FACTOR: " + factor, width/2, 64);
  translate(width/2, height/2);
  rotate(-PI/2);
  stroke(line_color);
  strokeWeight(line_weight);
  for (int i = 0; i < num_nodes; i++)
  {
    Node n = nodes.get(i % num_nodes);
    Node target = nodes.get((i * factor) % num_nodes);
    n.show(target);
  }
}

void mousePressed()
{
  factor = int(abs(mouseY) / 10);
}