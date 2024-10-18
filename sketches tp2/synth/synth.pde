import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048); // type, buffer size
  out.setTempo(120); // global tempo
  
  out.pauseNotes();
  
  // Frequency.ofPitch("C3").asHz() per passar notes a freqüència
  out.playNote(0, .3, new OF1(Frequency.ofPitch("C4").asHz(), 2));
  out.playNote(1, .3, new OF1(Frequency.ofPitch("Eb4").asHz(), 2));
  out.playNote(2, .3, new OF1(Frequency.ofPitch("F4").asHz(), 2));
  out.playNote(3, .3, new OF1(Frequency.ofPitch("G4").asHz(), 2));
  out.playNote(4, .3, new OF1(Frequency.ofPitch("F4").asHz(), 2));
  out.playNote(5, .3, new OF1(Frequency.ofPitch("Eb4").asHz(), 2));
  
  out.resumeNotes();
}

void draw() {
  // needed for audio with Minim
}
