import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import themidibus.*;

Minim minim;
AudioOutput out;
MidiBus myBus;

OF1 synth;

// Presets: Wavetable w1, Wavetable w2, Wavetable w3, Wavetable wsub,
//          float f1, float f2, float f3, float fsub, float a1, float a2, float a3, float asub,
//          float a, float d, float s, float r, int cut, float res

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048); // type, buffer size
  out.setTempo(240); // global tempo
  
  myBus = new MidiBus(this, 1, -1);

  synth = new OF1(440, 1);
}

void draw() {
  // needed for audio with Minim
}

void noteOn(int channel, int pitch, int velocity) {
  synth.noteOn(Frequency.ofMidiNote(pitch).asHz());
}

void noteOff(int channel, int pitch, int velocity) {
  synth.noteOff();
}

void controllerChange(int channel, int number, int value) {
  if (number == 12) synth.setCut(value * 8000 / 127);
}
