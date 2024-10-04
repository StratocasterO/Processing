// Sketch that draws with MIDI: turn CC knobs 14, 15 and 16!

import themidibus.*;

MidiBus myBus;
int value;
int channel;
int number;
color col;
int bri = 0;
int incr = 1;

void setup() {
  // canvas i colors
  // size(1600, 800);
  fullScreen();
  background(#EAB2B2);
  colorMode(HSB, 255);
  strokeWeight(8);
  fill(0,0);
  noCursor();
  
  // midibus init
  MidiBus.list();
  myBus = new MidiBus(this, 1, -1); // QX49
}

void draw() { 
  stroke(col);

  // K1, K2 i K3 del QX49 -> linies, cercles i quadrats
  if(number == 14) {
    float y = map(value, 0, 127, 0, height);
    line(0, y, width, y);
    changeColor();
  }
  
  if(number == 15) {
    ellipse(width, height, value*16, value*16);
    changeColor();
  }
  
  if(number == 16) {
    rect(0, 0, value*6, value*6);
    changeColor();
  }
  
  number = 0;
}

// canvia el color cada cop que dibuixa algo
void changeColor() {
  this.col = color(0,0,bri);
  if (this.bri == 255) {
    this.incr = -1;
  }
  if (this.bri == 0) {
     this.incr = 1;
  }
  this.bri = this.bri + this.incr;
  println(this.bri);
}

// funció que llegeix canvis en els MIDI CC
void controllerChange(int channel, int number, int value) {
  println(channel, number, value);
  
  this.value = value;
  this.channel = channel;
  this.number = number;
}
