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
  out = minim.getLineOut();
  out.setTempo(140); // global tempo
  
  out.pauseNotes();
  
  // Frequency.ofPitch("C3").asHz() per passar notes a freqüència
  out.playNote(0, 1, new OF1(Frequency.ofPitch("C3").asHz()));
  
  out.resumeNotes();
}

void draw() {
  // needed for audio with Minim
}
