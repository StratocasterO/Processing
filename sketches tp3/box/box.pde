int a;
PImage img;
PShape box;

void setup() {
  size(800, 450, P3D);
  background(0);
  
  img = loadImage("dirt.jpg");
  box = createShape(BOX, 100);
  box.setTexture(img);
  
  translate(0, 225, 200);
  shape(box);
  
  strokeWeight(0);
  
  a = 0;
}

void draw() {
  background(0);
  a += 1;
  translate(a, 225, 200);
  rotateY(a/100.);
  
  shape(box);
}
