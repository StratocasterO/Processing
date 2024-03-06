//               APLICACIÓ CALCULADORA
// Aplicació ampliada amb factorial, array swap, sinus, mcm i MCD

int num, num1, num2, res;
int phase;
char op;

void setup() {
  size(200,200);
  textSize(20);
  textAlign(CENTER);
  noLoop();
  fill(255);
  phase = 0; 
  
  println("2 + 4 = " + pote(2,4));
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
  } else if (phase == 3) {
    num2 = num;
    switch(op) {  // fa la operació corresponent
      case '+': 
        res = suma(num1, num2); break;
      case '-': 
        res = resta(num1, num2); break;
      case '*': 
        res = multi(num1, num2); break;
      case 'p': 
        res = pote(num1, num2); break;
    }
    text("El resultat és " + res, width/2, height/2);
    textSize(10);
    text("Prem qualsevol tecla per reiniciar", width/2, height/2 + 70);
  } else {
    fill(255,0,0);
    text("Has fet alguna\ncosa malament", width/2, height/2);
    textSize(10);
    text("Prem qualsevol tecla per reiniciar", width/2, height/2 + 70);
  }
}

void keyPressed() {
  if ((key >= 48 && key <= 57) && (phase == 0 || phase == 2)) {
    num = key - 48; // use ascii codes to select only numbers
    phase ++;
  } else if (phase == 1 && (key == '+' || key == '-' || key == '*' || key == 'p')) {
    op = key;
    phase ++;
  } else if (phase == -1) {
    setup();
  } else {
    phase = -1; // captura errors
  }
  redraw();
}
