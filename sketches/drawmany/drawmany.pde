// Sketch that draws shapes depending on keyboard numbers being pressed
// Press numbers 0-9 to generat that many shapes in the canvas

int num;

void setup() {
  size(800, 450);
  background(0);
  noLoop();
}

void draw() {
  fill(0,80);
  rect(0, 0, width, height);
  textSize(20);
  fill(255);
  text(num, 0, height);
  for (int i=0; i<num; i++) ellipse(random(100,width-100),random(100,height-100),random(50,200),random(50,200));
}

void keyPressed() {
  if (key >= 48 && key <= 57) num = key - 48; // use ascii codes to select only numbers
  redraw();
}
