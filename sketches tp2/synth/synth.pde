import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
String[] seq_bass = {"C2", "C2", "Eb2", "C2", "C2", "C2", "C2", "C3"};

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048); // type, buffer size
  out.setTempo(240); // global tempo

  out.pauseNotes();

  // Frequency.ofPitch("C3").asHz() per passar notes a freqüència
   out.playNote(0, .3, new OF1(Frequency.ofPitch("C4").asHz()));
   out.playNote(1, .3, new OF1(Frequency.ofPitch("Eb4").asHz()));
   out.playNote(2, .3, new OF1(Frequency.ofPitch("F4").asHz()));
   out.playNote(3, .3, new OF1(Frequency.ofPitch("G4").asHz()));
   out.playNote(4, .3, new OF1(Frequency.ofPitch("F4").asHz()));
   out.playNote(5, .3, new OF1(Frequency.ofPitch("Eb4").asHz()));

  //for (int bar = 0; bar < 16; bar++) {
  // for (int i = 0; i < seq_bass.length; i++) {
  //   out.playNote( bar * 8 + 0.5 * i, 0.1, seq_bass[i]);
  //   out.playNote( bar * 8 + 0.5 * i + 0.75, 0.25, seq_bass[i]);
  // }
  //}

  out.resumeNotes();
}

void draw() {
  // needed for audio with Minim
}
