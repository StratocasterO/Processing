import processing.sound.*;
SoundFile loop;
Amplitude amp;
BeatDetector bd;
FFT fft;
int bands = 2048;

float[] spectrum = new float[bands];

String[] loops = {"glitch.wav", "perc.wav", "synth.mp3", "folk.mp3"};
int[][] orange = {{253, 89, 1}, {247, 129, 4}, {250, 171, 54}};
int[][] teal = {{36, 158, 160}, {0, 128, 131}, {0, 95, 96}};
int[] strokeC = {255, 166, 115};

int count = 0;
int or = 0;
int te = 0;

void setup() {
  size(640, 360, P3D);
  background(0);
  
  loop = new SoundFile(this, loops[1]);
  loop.loop();
  
  amp = new Amplitude(this);
  amp.input(loop);
  
  bd = new BeatDetector(this);
  bd.input(loop);
  
  fft = new FFT(this, bands);
  fft.input(loop);
}      

void draw() {
  background(0);
  noStroke();
  
  directionalLight(orange[or][0], orange[or][1], orange[or][2], 1, 0, -.3);
  directionalLight(teal[te][0], teal[te][1], teal[te][2], -1, 0, -.3);
  
  pushMatrix();
  translate(320, 180, 0);
  fill(250,250,250);
  sphere(100 + amp.analyze() * 50);
  popMatrix();
  
  if (bd.isBeat()){
    if (count % 2 == 0) or = floor(random(0,3));
    else te = floor(random(0,3));
  
  count++;
  }
  
  fft.analyze(spectrum);
  stroke(strokeC[0],strokeC[1],strokeC[2]);
  strokeWeight(3);
  for(int i = 0; i < bands/6; i++){
    float x = 140 * cos(i* 2*PI *6/ bands + frameCount/200.);
    float z = 140 * sin(i* 2*PI *6/ bands + frameCount/200.);
    
    pushMatrix();
    translate(width/2, -200, 0);
    line(x, height + 100, z, x, height - spectrum[i] * height * 3 + 100, z);
    //line(i * width*6/bands, height, 0, i * width*6/bands, height - spectrum[i] * height * 5, 0);
    popMatrix();
  }
  
  pushMatrix();
  rotate(-PI/2);
  text("Press numbers 1 to 4 to change the audio file",-300,70,50);
  popMatrix();
}

public void keyPressed(){
    loop.stop();
    
    if (keyCode == 49) { 
      loop = new SoundFile(this, loops[0]); 
      strokeC[0] = 255;
      strokeC[0] = 79;
      strokeC[0] = 15;
    } else if (keyCode == 50) { 
      loop = new SoundFile(this, loops[1]); 
      strokeC[0] = 255;
      strokeC[0] = 166;
      strokeC[0] = 115;
    } else if (keyCode == 51) { 
      loop = new SoundFile(this, loops[2]); 
      strokeC[0] = 255;
      strokeC[0] = 227;
      strokeC[0] = 187; 
    } else if (keyCode == 52) { 
      loop = new SoundFile(this, loops[3]); 
      strokeC[0] = 3;
      strokeC[0] = 166;
      strokeC[0] = 161;
    }
    
    loop.loop();
    amp.input(loop);
    bd.input(loop);
    fft.input(loop);
}
