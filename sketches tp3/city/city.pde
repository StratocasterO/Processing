PImage asphalt;
PImage[] facades = new PImage[4];
PShape ground;
PShape building;

void setup() {
  size(800,450,P3D);
  background(0);
  
  directionalLight(36, 158, 160,-.8,1,-.6);
  spotLight(200, 100, 4, 100, height/4, 600, 0, 0, -1, PI/4, 2);
  ambientLight(40,40,30);
  
  asphalt = loadImage("asphalt2.jpg");
  facades[0] = loadImage("concrete.jpg");
  facades[1] = loadImage("concrete2.jpg");
  facades[2] = loadImage("concrete3.jpg");
  facades[3] = loadImage("concrete4.jpg");
  strokeWeight(0);
  
  ground = createShape(BOX, 2000, 0, 2000);
  ground.setTexture(asphalt);
  
  translate(400, 150, -800);
  rotateX(-PI/5);
  rotateY(PI/4);
  shape(ground);
  
  for(int i = 0; i < 20; i++){
    for(int j = 0; j < 20; j++){
      pushMatrix();
      building = createShape(BOX, random(40,70), random(20,700), random(30,70));
      building.setTexture(facades[floor(random(0,4))]);
      
      translate(-1000 + 100 * i, 0, -1000 + 100 * j);
      rotateY(random(0, .15));
      shape(building);
      
      popMatrix();
    }
  }
  shape(building);
}

void draw() {
  
}
