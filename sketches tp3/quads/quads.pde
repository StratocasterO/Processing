ArrayList<Integer> points;
int x,y;

int canvas = 800;  // mida de la pantalla
int size = 100;    // mida dels quads
int amount = 150;  // quantitat de quads

void setup() {
  size(0, 0);
  windowResize(canvas, canvas);
  
  strokeWeight(0);
  
  points = new ArrayList<Integer>();
}

void draw() {
  background(0);

  for (int i = 0; i < amount; i++) {
    x = floor(random(canvas - size));
    y = floor(random(canvas - size));
  
    for (int j = 0; j < 4; j++) {
      points.add(x + int(random(size)));
      points.add(y + int(random(size)));
    }
  
    fill(random(255),0,random(255));
    
    println(points);
    
    quad(
        points.get(0),
        points.get(1),
        points.get(2),
        points.get(3),
        points.get(4),
        points.get(5),
        points.get(6),
        points.get(7)
      );
    
    points.clear();
  }
  
  noLoop();
}

// clica per regenerar els quads
void mouseClicked() {
  redraw();
}
