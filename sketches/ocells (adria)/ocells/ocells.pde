/*
Adrià Illa, DIA de MES de ANY
---
##FotoSo##
Reprodueix diferents samples al clicar sobre les diferents finestres del fons de pantalla.
Al clicar sobre una finestra aquesta és ressaltada.
Sons d'ocells proveïts per l'Omar Olmedo.
---
Funció highlightSquare() inicial, amb recursivitat, inclosa al final. 
*/

import ddf.minim.*;

Minim minim;
AudioSample player;

//Square positions
int[] posX = {250, 340, 435, 530, 250, 340, 435, 530};
int[] posY = {170, 165, 155, 150, 285, 285, 285, 285};

//Square opacity
int[] opacities = new int[8];
int[] opBool = new int[8];

int RECTWIDTH = 60;
int RECTHEIGHT = 75;
int MAXOPACITY = 255;

void setup(){
  size(736,488);
  noStroke(); //No outlines
  
  minim = new Minim(this);
  
  for (int i=0; i<8; i++)
     opacities[i] = 0; 
  
}

void draw(){
  background(loadImage("fons.jpeg"));
  
  for (int i=0; i<8; i++){
    //Change the opacities of the squares
    if(opBool[i] == 1 && opacities[i] < MAXOPACITY)
      opacities[i] += 5;
    else if (opBool[i] == -1 && opacities[i] > 0)
      opacities[i] -= 5;
  }
  
  for (int i=0; i<8; i++){
    //Draw the squares
    fill(#000000, opacities[i]);
    rect(posX[i], posY[i], RECTWIDTH, RECTHEIGHT);
  }
}

void mousePressed(){
  if(mouseX > posX[0] && mouseX < (posX[0] + RECTWIDTH)&&
     mouseY > posY[0] && mouseY < (posY[0] + RECTHEIGHT)) { 
       playSamples(0);
       highlightSquare(0);
   } else if(mouseX > posX[1] && mouseX < (posX[1] + RECTWIDTH)&&
     mouseY > posY[1] && mouseY < (posY[1] + RECTHEIGHT)) {
       playSamples(1);
       highlightSquare(1);
   } else if(mouseX > posX[2] && mouseX < (posX[2] + RECTWIDTH)&&
     mouseY > posY[2] && mouseY < (posY[2] + RECTHEIGHT)) {
       playSamples(2);
       highlightSquare(2);
   } else if(mouseX > posX[3] && mouseX < (posX[3] + RECTWIDTH)&&
     mouseY > posY[3] && mouseY < (posY[3] + RECTHEIGHT)) {
       playSamples(3);
       highlightSquare(3);
   } else if(mouseX > posX[4] && mouseX < (posX[4] + RECTWIDTH)&&
     mouseY > posY[4] && mouseY < (posY[4] + RECTHEIGHT)) {
       playSamples(4);
       highlightSquare(4);
   } else if(mouseX > posX[5] && mouseX < (posX[5] + RECTWIDTH)&&
     mouseY > posY[5] && mouseY < (posY[5] + RECTHEIGHT)) {
       playSamples(5);
       highlightSquare(5);
   } else if(mouseX > posX[6] && mouseX < (posX[6] + RECTWIDTH)&&
     mouseY > posY[6] && mouseY < (posY[6] + RECTHEIGHT)) {
       playSamples(6);
       highlightSquare(6);
   } else if(mouseX > posX[7] && mouseX < (posX[7] + RECTWIDTH)&&
     mouseY > posY[7] && mouseY < (posY[7] + RECTHEIGHT)) {
       playSamples(7);
       highlightSquare(7);
   }
}

void playSamples(int sq){
  switch(sq){
    case 0:
      player = minim.loadSample("pajars/25.mp3");
      break;
    case 1:
      player = minim.loadSample("pajars/26.mp3");
      break;
    case 2:
      player = minim.loadSample("pajars/27.mp3");
      break;
    case 3:
      player = minim.loadSample("pajars/28.mp3");
      break;
    case 4:
      player = minim.loadSample("pajars/29.mp3");
      break;
    case 5:
      player = minim.loadSample("pajars/30.mp3");
      break;
    case 6:
      player = minim.loadSample("pajars/31.mp3");
      break;
    case 7:
      player = minim.loadSample("pajars/32.mp3");
      break;
  }
  player.trigger();
}

void highlightSquare(int sq){
  for (int i=0; i<8; i++){
    if (i == sq){
      opBool[i] = 1;
    } else {
      opBool[i] = -1;
    }
  }
}


void highlightSquare_VELL(int sq, boolean increase, int opValue){
  /*
    Fades in selected square sq, fades out all the other squares, 
    resulting in only one square being highlighted at a time.
  */
  if (opValue >= 0 && opValue <= MAXOPACITY){
    //Not totally faded in/out
    println(opValue);
    if(increase){
      //FADE IN
      for (int i=0; i<8; i++){
        //Loop through squares
        if (i == sq) {
          //Affected square
          opValue += 1;
          opacities[i] = opValue;
          highlightSquare_VELL(i, true, opValue); //Further fade in
        }
        else {
          //Fade out other squares
          highlightSquare_VELL(i, false, MAXOPACITY);          
        }
      }
    } else {
      //FADE OUT
      for (int i=0; i<8; i++){
        //Loop through squares
        if (i == sq) {
          //Affected square
          opValue -= 1;
          opacities[i] = opValue;
          delay(5);
          highlightSquare_VELL(i, false, opValue); //Further fade out
        }
      }
    }
  }
} 
