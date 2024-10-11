import ddf.minim.*;

Minim minim;
AudioOutput out;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut();
  out.setTempo(140); // global tempo
  
  out.playNote(0.0, 2.8, 200.0);  //  play note with default instrument
  out.playNote(0.2, 2.6, 300.0);  // (start beat, duration in beats, freq)
  out.playNote(0.4, 2.4, 386.0);

  out.playNote(2.4, 2.0, 200.0);
  out.playNote(2.4, 2.0, 300.0);
  out.playNote(2.4, 2.0, 400.0);
}

void draw() {
  // needed for audio with Minim
}
