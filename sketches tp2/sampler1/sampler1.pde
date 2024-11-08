// Exercici de samplers instanciant-los directament

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
Sampler kick, snr, cow, hat;
AudioOutput out;

void setup() {
  // initialitzation
  minim = new Minim(this);
  out = minim.getLineOut();
  Sampler kick  = new Sampler("kick.wav", 1, minim);
  Sampler snr  = new Sampler("snare.wav", 1, minim);
  Sampler cow  = new Sampler("cowbell.wav", 1, minim);
  Sampler hat  = new Sampler("hat.wav", 1, minim);

  // patch samplers
  kick.patch(out);
  snr.patch(out);
  cow.patch(out);
  hat.patch(out);

  // rhythm loop
  for (int i = 0; i < 16; i++) {
    kick.trigger();
    hat.trigger();
    delay(180);
    hat.trigger();
    delay(180);
    
    snr.trigger();
    hat.trigger();
    delay(180);
    hat.trigger();
    delay(180);
    
    cow.trigger();
    hat.trigger();
    delay(180);
    hat.trigger();
    delay(180);
    
    snr.trigger();
    hat.trigger();
    delay(180);
    hat.trigger();
    delay(180);
  }
}

void draw() {
  // needed for minim
}
