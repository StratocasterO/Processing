int a;
PImage img;
PShape box;

void setup() {
  size(800, 450, P3D);
  background(0);
  
  strokeWeight(0);
  
  ambientLight(100,100,100);
  directionalLight(255, 255, 200, 0, 1, -.8);
  pointLight(100, 100, 150, width * 1.5, 0, 400);
  
  img = loadImage("cobble.png");
  box = createShape(BOX, 100);
  box.setTexture(img);
  
  translate(50, -100, 0);
  rotateY(.3);
  rotateX(-.1);
  shape(box);
  
  for(int i=0; i < 15; i++){
    for(int j=0; j < 10; j++){
      pushMatrix();
      translate(100 * i, 100 * j, random(-50,50));
      shape(box);
      popMatrix();
    }
  }
  
  a = 0;
}

void draw() {
  
}
