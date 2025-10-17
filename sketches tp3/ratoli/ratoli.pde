int len;
int hue;

void setup(){
  size(600,600);
  background(0);
  
  len = 0;
  
  colorMode(HSB, 360, 100, 100);
  hue = 0;
}

void draw(){
  
}

void mouseDragged() {
 stroke(hue, 100, 100);
 strokeWeight(4);
 line(mouseX, mouseY, pmouseX, pmouseY);
 
 len += dist(mouseX, mouseY, pmouseX, pmouseY);
 
 if (len > 200) {
  stroke(360);
  ellipse(mouseX, mouseY, 8, 8);
  len = 0;
 }
 
 hue++;
 hue = hue % 360;
}

void mousePressed(){
 background(0); 
}
