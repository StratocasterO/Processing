// Hit tab to change between moving, trailing (short and long) 
// and painting modes in cycle

void setup() {
  size(800, 600);
  background(0);  
}

int pos = 0;
int sign = 1; 
int mode = 0;

void draw() {
  if (mode % 4 == 0) move();
  else if (mode % 4 == 1) trailS();
  else if (mode % 4 == 2) trailL();
  else if (mode % 4 == 3) paint();
}

void keyPressed(){
  if (key == ' ') {
    mode ++;
  }
}
