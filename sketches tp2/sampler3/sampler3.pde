// Exercici de samplers instanciant-los dins una classe amb zones de notes

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
    sampler.noteOn(60);
    sampler.noteOn(63);
    delay(180);
    sampler.noteOn(63);
    delay(180);
    
    sampler.noteOn(61);
    sampler.noteOn(63);
    delay(180);
    sampler.noteOn(63);
    delay(180);
    
    sampler.noteOn(62);
    sampler.noteOn(63);
    delay(180);
    sampler.noteOn(63);
    delay(180);
    
    sampler.noteOn(61);
    sampler.noteOn(63);
    delay(180);
    sampler.noteOn(63);
    delay(180);
  }
}

class MySampler implements Instrument {
  Sampler kick, snr, cow, hat;
  Gain hatGain, cowGain;

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
    switch (note) {
      case 60:
        kick.trigger();
        kick.trigger();
        kick.trigger();
        kick.trigger(); // thicccc kick drum
        break;
      case 61:
        snr.trigger();
        break;
      case 62:
        cow.trigger();
        break;
      case 63:
        hat.trigger();
        break;
    }
  }

  void noteOff() {
  }
}

void draw() {
  // needed for minim
}
