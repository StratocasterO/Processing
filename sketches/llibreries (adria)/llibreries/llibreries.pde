/*
Adrià Illa, 3 d'Abril de 2024
---
##LLIBRERIES##
Ús de la llibreria Minim. 
Per a instal·lar, Tools->Manage Tools->Libraries. 
Exemples a File->Exemples->Contributed Libraries.
---
Modificat per: 
Omar Olmedo
---
Documentació de la llibreria: https://code.compartmental.net/minim/  
*/

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(512, 200, P3D);
  
  //Per a poder llegir fitxers de la carpeta data
  minim = new Minim(this);
  
  player = minim.loadFile("groove.mp3");
}

void draw(){
  background(0);
  stroke(255);
  
  //Dibuixar les formes d'ona
  for (int i=0; i < player.bufferSize()-1; i++){
    //Escalar els valors 0...bufferSize a 0...width
    float x1 = map(i, 0, player.bufferSize(), 0, width); //x inicial 
    float x2 = map(i, 0, player.bufferSize(), 0, width); //x final
    
    //Dibuixar les dues línies, pel canal L i R respectivament
    line(x1, 50  + player.left.get(i)*50,  x2, 50  + player.left.get(i+1)*50);
    line(x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50);
  }
  
  //Dibuixar cursor amb la posició de l'àudio
  float posX = map(player.position(), 0, player.length(), 0, width); //Escalar els valors 0...length a 0...width
  stroke(200, 0, 0);
  line(posX, 0, posX, height);
  
  if (player.isPlaying()) text("Press any key to pause playback.", 10, 20);
  else                    text("Press any key to start playback.", 10, 20);
  
}

void keyPressed(){
  if (player.isPlaying()) {
    player.pause();
  } else if (player.position() == player.length()) {
    player.rewind();
    player.play();
  } else {
    player.play();
  }
}
