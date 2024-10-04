/*
Adrià Illa, 19 de Març de 2024
Tècniques de programació I.
---
##Examen any anterior##
DEFINICIÓ
---
INFO EXTRA
*/

String inici = "Prem una tecla";
int cas; //0: Número
         //1: Majúscula
         //2: Minúscula
         //3: Altre
         //4: Estat inicial
PImage imatge;

int DEF_SIZE = 20;
int DEF_COL = 255;

void setup(){
  noLoop();
  size(500, 500);
  background(0);
  
  cas = 4;
  imatge = loadImage("imatge.png"); //Imatge situada a la carpeta `data` d'aquest programa.
  redraw(); //Dibuixar el text inicial
}

void draw(){
  background(0); //Netejar el Canvas
  switch(cas){
    case 0:
      //Número (Pregunta 3)
      textSize((key - 40) * 5);
      fill(DEF_COL, DEF_COL, DEF_COL); //Restaurar el color al default
      text(key, random(width), random(height));
      break;
    case 1:
      //Minúscula (Pregunta 4)
      image(imatge, 0, 0);
      break;
    case 2:
      //Majúscula (Pregunta 5)
      textSize(DEF_SIZE); //Restaurar la mida del text al default
      fill(random(10, 255), random(10, 255), random(10, 255));
      text(key, random(width), random(height));
      break;
    case 3:
      //Altre (Pregunta 6)
      cas = 4;
      setup(); //redraw();
      break;
    case 4:
      //Inici (Pregunta 1, Pregunta 6)
      textSize(DEF_SIZE); //Restaurar la mida del text al default
      fill(DEF_COL, DEF_COL, DEF_COL); //Restaurar el color al default
      text(inici, 200, 200);
      break;
  }
}

void keyPressed(){
  /*
  En codi ASCII, els rangs son els següents:
    48-57 = 0-9
    65-90 = A-Z
    97-122 = a-z
  Per tant:
  if (48 <= key && key <= 57)     println("Número");
  else if (65 <=key && key <=90)  println("Minúscula");
  else if (97 <=key && key <=122) println("Majúscula");
  else                            println("Altre");
  */
  
  //Implementació més fàcil d'entendre: (Pregunta 2)
  if ('0' <= key && key <= '9')       cas = 0;
  else if ('A' <= key && key <= 'Z')  cas = 1;
  else if ('a' <= key && key <= 'z')  cas = 2;
  else                                cas = 3;
  
  redraw(); //Processem el cas a la funció draw()
}
