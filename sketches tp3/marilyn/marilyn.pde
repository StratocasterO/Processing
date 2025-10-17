PImage monroe;
int x = 370;
int y = 377;
int dim = 4;
int num;

void setup() {
  size(1,1);
  background(0,0,0);
  
  x = 370;
  y = 377;
  
  windowResize(x * dim / 2 + 5 * (dim + 1), y * dim / 2 + 5 * (dim + 1));
}

void draw() {
  x /= 2;
  y /= 2;
  monroe = loadImage("MMonroe.jpg");
  monroe.resize(x, y);
  image(monroe, 5, 5);

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      num = 1 + i + 4*j;
      image(monroe, 5 + i*(x+5), 5 + j*(y+5));
      
      // parells
      if (num % 2 == 0){
        fill(255,0,0, 64);
        rect(5 + i*(x+5), 5 + j*(y+5), x, y);
      }
      
      // potencies de 2
      if (floor(log(num) / log(2)) == log(num) / log(2)) {
        fill(0,255,0, 64);
        rect(5 + i*(x+5), 5 + j*(y+5), x, y);
        println(num);
      }
      
      // senars amb probabilitat
      if (num % 2 != 0){
        if (random(1) < .33){
          fill(0,0,255, 64);
          rect(5 + i*(x+5), 5 + j*(y+5), x, y);
        }
      }
    }
  }
  
  noLoop();
}
