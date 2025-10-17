int[] deltaY = new int[96];
int[] deltaSize = new int[96];
int speed = 20;
int delay = 40;

void setup(){
  size(1200,600);
  background(0,0,0);
  textFont(createFont("Courier New Bold", 26));
  fill(0,255,0);
  
  for (int i=0; i<96; i++) {
    deltaY[i] = -(int)random(height);
  }
  
  for (int i=0; i<96; i++) {
    deltaSize[i] = -(int)random(15);
  }
  
  println(deltaY);
  println(deltaSize);
}

void draw(){
  fill(0,0,0,30);
  rect(0,0,width,height);
  
  fill(0,255,0);

  for (int i=0; i<96; i++) {
    textSize(26 + deltaSize[i]);
    text((char)random(256),i*13,deltaY[i]);
  }
  
  for (int i=0; i<96; i++) {
    deltaY[i] += speed + deltaSize[i];
    if(deltaY[i] > height) deltaY[i] = 0;
    //if(deltaY[i] < 0) deltaY[i] = height;
  }
  
  delay(delay);
}

void keyPressed() {
    // canvia la gravetat amb les tecles UP i DOWN
    if (keyCode == UP) {
      speed--;
    } else if (keyCode == DOWN) {
      speed++;
    }
    
    // canvia la velocitat amb les tecles RIGHT i LEFT
    if (keyCode == LEFT) {
      delay++;
    } else if (keyCode == RIGHT) {
      delay--;
    }
}
