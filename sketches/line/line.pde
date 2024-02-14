// Sketch that draws a color changing line rebounding in the canvas 🌈

float x1, y1, x2, y2;
float speed_x1, speed_y1, speed_x2, speed_y2;
int hue;

void setup() {
  size(800, 450);
  colorMode(HSB);
  background(0);
  
  x1 = random(0,width);  
  x2 = random(0,width);  
  y1 = random(0,height);  
  y2 = random(0,height);
  
  speed_x1 = random(2,4);
  speed_x2 = random(2,4);
  speed_y1 = random(2,3);
  speed_y2 = random(2,3);
  
  hue = 0;
}

void draw() {
  fill(0, 15);
  stroke(0);
  rect(0, 0, width, height);
  stroke(hue, 255, 255);
  strokeWeight(4);
  line(x1, y1, x2, y2);
  
  if(x1 >= width || x1 <= 0) speed_x1 *= -1;
  if(x2 >= width || x2 <= 0) speed_x2 *= -1;
  if(y1 >= height || y1 <= 0) speed_y1 *= -1;
  if(y2 >= height || y2 <= 0) speed_y2 *= -1;
  
  x1 += speed_x1;
  x2 += speed_x2;
  y1 += speed_y1;
  y2 += speed_y2;
  
  hue = (hue + 1) % 255;
}
