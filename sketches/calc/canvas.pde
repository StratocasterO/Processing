// Aplicació calculadora

int num, num1, num2;
int phase;
char op;

void setup() {
  size(200,200);
  textSize(20);
  textAlign(CENTER);
  noLoop();
  fill(255);
  phase = 0;
}

void draw() {
  background(0);
  if (phase == 0) {
    text("Prem el primer número", width/2, height/2);
  } else if (phase == 1) {
    num1 = num;
    text("Prem la operació\n(+,-,*,p)", width/2, height/2);
  } else if (phase == 2) {
    text("Prem el segon número", width/2, height/2);
  } else {
    fill(255,0,0);
    text("Has fet alguna\ncosa malament", width/2, height/2);
    delay(1000);
    setup();
    redraw();
  }
}

void keyPressed() {
  if ((key >= 48 && key <= 57) && (phase == 0 || phase == 2)) {
    num = key - 48; // use ascii codes to select only numbers
    phase ++;
  } else if (phase == 1) {
    op = key;
    phase ++;
  } else {
    phase = -1;
  }
  println(key);
  redraw();
}
