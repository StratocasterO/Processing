// Exercici de samplers instanciant-los dins una classe

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MySampler kick;

void setup() {
  // initialitzation
  minim = new Minim(this);
  out = minim.getLineOut();
  MySampler sampler  = new MySampler();

  // rhythm loop
  for (int i = 0; i < 16; i++) {
    sampler.noteOn(30);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(50);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(80);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(50);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    sampler.noteOn(30);
    delay(180);
    
    sampler.noteOn(30);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(50);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(80);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
    
    sampler.noteOn(50);
    sampler.noteOn(100);
    delay(180);
    sampler.noteOn(100);
    delay(180);
  }
}

class MySampler implements Instrument {
  Sampler kick, snr, cow, hat;
  Gain hatGain, cowGain;
  int[] ranges = {0, 32, 64, 96, 128};  // note ranges

  MySampler() {
    // busca els samples a la carpeta del sampler1
    kick  = new Sampler("../../sampler1/data/kick.wav", 4, minim );
    snr  = new Sampler("../../sampler1/data/snare.wav", 1, minim);
    cow  = new Sampler("../../sampler1/data/cowbell.wav", 1, minim);
    hat  = new Sampler("../../sampler1/data/hat.wav", 1, minim);

    hatGain = new Gain(-8.0);
    cowGain = new Gain(-6.0);

    kick.patch(out);
    snr.patch(out);
    cow.patch(cowGain).patch(out);
    hat.patch(hatGain).patch(out);
  }
  
  void noteOn(float dur) {
    // needed for interface implementation
  }

  void noteOn(int note) {
    if (note >= ranges[0] && note < ranges[1]) { kick.trigger(); kick.trigger(); } // thicccc kick drum
    else if (note >= ranges[1] && note < ranges[2]) snr.trigger();
    else if (note >= ranges[2] && note < ranges[3]) cow.trigger();
    else if (note >= ranges[3] && note < ranges[4]) hat.trigger();
  }

  void noteOff() {
  }
}

void draw() {
  // needed for minim
}
