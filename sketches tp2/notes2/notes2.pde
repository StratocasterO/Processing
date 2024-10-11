import ddf.minim.*;

Minim minim;
AudioOutput out;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut();
  out.setTempo(260); // global tempo
  
  out.pauseNotes();  // pausa mentre es carreguen les notes
  
  for (int i = 0; i < 18; i++) {
    // arpegi
    out.playNote(4*i + 0, .8, "A3");
    out.playNote(4*i + 1, .8, "C4");
    out.playNote(4*i + 2, .8, "E4");
    out.playNote(4*i + 3, .8, "F#4");

    // baix
    out.playNote(4*i + 0, 2, "A2");
    out.playNote(4*i + 2, 2, "E2");
  }
  
  // melodia
  out.playNote(8 + 0, 1.5, "A4");
  out.playNote(8 + 1.5, 1.5, "A4");
  out.playNote(12 + 0, 1.5, "A4");
  out.playNote(12 + 1.5, 1.5, "E4");
  
  out.playNote(16 + 8 + 0, 1.5, "A4");
  out.playNote(16 + 8 + 1.5, 1.5, "A4");
  out.playNote(16 + 12 + 0, 1.5, "A4");
  out.playNote(16 + 12 + 1.5, 1.5, "G4");
  
  out.playNote(32 + 8 + 0, 1.5, "G4");
  out.playNote(32 + 8 + 1.5, 1.5, "G4");
  out.playNote(32 + 12 + 0, 1.5, "G4");
  out.playNote(32 + 12 + 1.5, 1.5, "F#4");
  
  out.playNote(48 + 8 + 0, 1.5, "F#4");
  out.playNote(48 + 8 + 1.5, 1.5, "F#4");
  out.playNote(48 + 12 + 0, 1.5, "F#4");
  out.playNote(48 + 12 + 1.5, 1.5, "E4");
  
  out.resumeNotes();  // inicia les notes
}

void draw() {
  // needed for audio with Minim
}
