PImage img;
Node[] nodes;
Edge[] edges;

int STEP = 20;
int DEPTH = 10;

void setup() {
  size(640, 640, P2D);
  colorMode(RGB, 255);
  smooth();
 
  fill(255, 255, 255);
  noStroke();
  rect(0, 0, width, height);
  
  img = loadImage("kris1.jpg");
  img.resize(width, height);
  img.filter(GRAY);
  image(img, 0, 0);
  
  int cols = width / STEP;
  int rows = height / STEP;
  
  nodes = new Node[cols * rows * 2];
  edges = new Edge[5 * cols * rows - 2 * rows - 2 * cols];
  
  int e = 0;
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Node n1 = new Node(i * STEP, j * STEP, 0);
      Node n2 = new Node(i * STEP + 7, j * STEP + 7, DEPTH);
      nodes[2 * rows * i + 2 * j] = n1;
      nodes[2 * rows * i + 2 * j + 1] = n2;
      
      edges[e++] = new Edge(n1, n2);
      if (i > 0) {
        edges[e++] = new Edge(n1, nodes[2 * rows * (i - 1) + 2 * j]);
        edges[e++] = new Edge(n2, nodes[2 * rows * (i - 1) + 2 * j + 1]);
      }
      if (j > 0) {
        edges[e++] = new Edge(n1, nodes[2 * rows * i + 2 * (j - 1)]);
        edges[e++] = new Edge(n2, nodes[2 * rows * i + 2 * (j - 1) + 1]);
      }
          
    }
  }
  
  stroke(255, 255, 255);
  
  for (int i = 0; i < e; i++)
    line(edges[i].n1.x, edges[i].n1.y, edges[i].n2.x, edges[i].n2.y);
    
  //for (int i = 0; i < nodes.length; i++)
  //  ellipse(nodes[i].x, nodes[i].y, 2, 2);
}


void draw() {
}