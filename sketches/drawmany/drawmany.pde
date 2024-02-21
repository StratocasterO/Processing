// Sketch that draws shapes depending on keyboard numbers being pressed
// Press numbers 0-9 to generat that many shapes in the canvas
// Press R, C or L to change between drawing Rectangles, Circles or Lines

int num;
float a, b, c, d;
char shape;

void setup() {
  size(800, 450);
  background(0);
  noLoop();
  rectMode(CENTER);
  textSize(20);
  shape = 'c';
}

void draw() {  
  stroke(0);
  fill(0,80);
  strokeWeight(2);
  rect(width/2, height/2, width, height);  // repaints black background for fade effect
  
  fill(255);
  text(num, 0, height);
  
  for (int i=0; i<num; i++) {
    if (shape == 'c') ellipse(random(100,width-100),random(100,height-100),random(50,200),random(50,200));
    if (shape == 'r') rect(random(100,width-100),random(100,height-100),random(50,200),random(50,200));
    if (shape == 'l') {
      stroke(0);  // draw two lines with different thickness
      strokeWeight(7);
      a = random(10,width-10);
      b = random(10,height-10);
      c = random(10,width-10);
      d = random(10,height-10);
      line(a, b, c, d);
      stroke(255);
      strokeWeight(3);
      line(a, b, c, d);
    }
  }
}

void keyPressed() {
  if (key >= 48 && key <= 57) {
    num = key - 48; // use ascii codes to select only numbers
    redraw();
  }
  
  if (key == 'c') shape = 'c';
  if (key == 'r') shape = 'r';
  if (key == 'l') shape = 'l';
}
