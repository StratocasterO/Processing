import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
String[] seq_bass = {"C2", "C2", "Eb2", "C2", "C2", "C2", "C2", "C3"};
Instrument C4, Eb4, F4, G4;
Instrument bC2, bEb2, bC3;

// Presets: Wavetable w1, Wavetable w2, Wavetable w3, Wavetable wsub,
//          float f1, float f2, float f3, float fsub, float a1, float a2, float a3, float asub,
//          float a, float d, float s, float r, int cut, float res

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048); // type, buffer size
  out.setTempo(240); // global tempo

  out.pauseNotes();

  C4 = new OF1(Frequency.ofPitch("C4").asHz(), 1);
  Eb4 = new OF1(Frequency.ofPitch("Eb4").asHz(), 1);
  F4 = new OF1(Frequency.ofPitch("F4").asHz(), 1);
  G4 = new OF1(Frequency.ofPitch("G4").asHz(), 1);
  
  // Frequency.ofPitch("C3").asHz() per passar notes a freqüència
  out.playNote(0, .3, C4);
  out.playNote(1, .3, Eb4);
  out.playNote(2, .3, F4);
  out.playNote(3, .3, G4);
  out.playNote(4, .3, F4);
  out.playNote(5, .3, Eb4);

  out.resumeNotes();
}

void draw() {
  // needed for audio with Minim
}
