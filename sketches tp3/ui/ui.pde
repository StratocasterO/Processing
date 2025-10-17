import g4p_controls.*;

GSlider red, green, blue;
GSlider2D xy;
GKnob knob;
GButton but;

int r,g,b;
int x,y;
int size;
float sX, sY;
float aX, aY;

void setup() {
  size(1000, 500);
  
  // (context, positionX, positionY, positionX_end, positionY_end, thickness)
  red = new GSlider(this, 100, 100, 200, 100, 15);
  green = new GSlider(this, 100, 150, 200, 100, 15);
  blue = new GSlider(this, 100, 200, 200, 100, 15);
  
  xy = new GSlider2D(this, 350, 130, 150, 150);
  
  knob = new GKnob(this, 100, 300, 80, 80, 1.0);
  
  but = new GButton(this, 220, 300, 80, 80);
  
  // init controls
  red.setValue(0.0);
  green.setValue(0.0);
  blue.setValue(0.0);
  knob.setValue(0.1);
  xy.setValueX(.5);
  xy.setValueY(.6);  
  
  // init values
  r = 0;
  g = 0;
  b = 0;
  x = 750;
  y = 250;
  size = 20;
  sX = 1;
  sY = 1;
  aX = 0;
  aY = .1;
}

void draw() {
  background(220, 215, 215);
  drawText();
  
  fill(255);
  rect(600, 100, 300, 300);
  
  fill(r,g,b);
  circle(x, y, size);
  
  // speed
  x += sX;
  y += sY;
  
  // acceleration
  sX = sX + aX;
  sY = sY + aY;
  
  if (x > (900 - size/2)) {sX = -sX * 0.8; x = 900 - size/2;} 
  if (x < (600 + size/2)) {sX = -sX * 0.8; x = 600 + size/2;}
  if (y > (400 - size/2)) {sY = -sY * 0.8; y = 400 - size/2;}
  if (y < (100 + size/2)) {sY = -sY * 0.8; y = 100 + size/2;}
}

void drawText() {
  fill(0);
  text("Red", 105, 135);
  text("Green", 105, 185);
  text("Blue", 105, 235);
  text("Size", 132, 393);
  text("Kick", 248, 393);
  text("Gravity X", 405, 123);
  
  pushMatrix();
  translate(508,183);
  rotate(PI/2);
  text("Gravity Y", 0, 0);
  popMatrix();

}

public void handleSliderEvents(GValueControl slider, GEvent event) {
  if (slider == red) r = (int)(red.getValueF() * 255);
  if (slider == green) g = (int)(green.getValueF() * 255);
  if (slider == blue) b = (int)(blue.getValueF() * 255);
}

public void handleButtonEvents(GButton but, GEvent event) {
  sX = (int)random(3,10);
  sY = (int)random(3,10);
}

public void handleKnobEvents(GValueControl knob, GEvent event) {
  size = (int)(10 + knob.getValueF() * 100);
}

public void handleSlider2DEvents(GSlider2D xy, GEvent event) {
  aX = xy.getValueXF() - 0.5;
  aY = xy.getValueYF() - 0.5;
}
