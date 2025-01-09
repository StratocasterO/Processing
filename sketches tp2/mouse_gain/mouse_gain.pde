import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
Sampler soundFile;
Gain2 gain;
Gain3 gain2;
AudioOutput out;

String fileName = "blues_guitar.wav"; // empra l'àudio que vulguis!

void setup() {
  size(640, 640);
  
  minim = new Minim(this);
  soundFile = new Sampler(fileName, 1, minim);
  soundFile.trigger();
  
  gain = new Gain2(0.f);
  gain2 = new Gain3(0.f);
  out = minim.getLineOut();
  soundFile.patch(gain).patch(gain2).patch(out);
  
  background(255);
  fill(0);
  textSize(30);
  text("X: overdrive\nY: filter",250,300);
}

void draw() {
  float dB = map(mouseX, 0, width, -12, 12);
  gain.setValue(dB);
  float logMouse = logB(mouseY + 1, 100);
  float dB2 = map(logMouse, 0, logB(height + 1, 100), 0, 1);
  gain2.setValue(dB2);
}

float logB(float a, float b) {
  return log(a) / log(b);
}
