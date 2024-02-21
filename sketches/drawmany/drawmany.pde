// Sketch that draws shapes depending on keyboard numbers being pressed
// Press numbers 0-9 to generat that many shapes in the canvas
// Press D, R, C or L to change between drawing random shapes (Default), 
// Rectangles, Circles or Lines

int num;
float a, b, c, d, r;
char shape;

void setup() {
  size(800, 450);
  background(0);
  noLoop();
  rectMode(CENTER);
  textSize(20);
  shape = 'd';
}

void draw() {  
  stroke(0);
  fill(0,80);
  strokeWeight(2);
  rect(width/2, height/2, width, height);  // repaints black background for fade effect
  
  fill(255);
  text(num, 0, height);
  
  for (int i=0; i<num; i++) {
    if (shape == 'c') drawCircle();
    if (shape == 'r') drawRect();
    if (shape == 'l') drawLine();
    if (shape == 'd') {
      r =  random(3);
      if (r < 1) drawCircle();
      else if (r > 1 && r < 2) drawRect();
      else {
        drawLine();
        stroke(0);
        strokeWeight(2);
      }
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
  if (key == 'd') shape = 'd';
}

void drawCircle() {
  ellipse(random(100,width-100),random(100,height-100),random(50,200),random(50,200));
}

void drawRect() {
  rect(random(100,width-100),random(100,height-100),random(50,200),random(50,200));
}

void drawLine() {
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
