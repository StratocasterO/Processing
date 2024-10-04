import ddf.minim.*;
import ddf.minim.ugens.*;

// recreation of Risset Arpeggio with Minim

// parameters
final int COUNT = 8;        // dimension N of the matrix of oscillators (N²). Recomended: 4-100
final int FUNDAM = 55;      // fundamental frequency. Recomended: 20-400
final float INHARMON = 0;   // amount of inharmonicity. Recomended: .01-.5 (0 is totally harmonic)
final float DIST = .1;      // distance between fundamentals. Recomended .01-5.0 (the bigger, the faster)
final float STEREO = .6;    // width of stereo field. Recomended 0.0-1.0 (0: mono, 1: 100& width)
final int DELAY = 0;        // millis between oscillators start. Recomended: 0-500 (0 for classic Risset)

// sound objects instantiation
Minim min;
AudioOutput dac;
Oscil[][] notes;
Pan panL, panR;
Summer mix, left, right;

void setup() {
  // init Minim, audio output, oscillators and mixer
  min = new Minim(this);
  dac = min.getLineOut();
  left = new Summer();
  right = new Summer();
  mix = new Summer();
  mix.setChannelCount(2);
  panL = new Pan(-STEREO);
  panR = new Pan(STEREO);
  
  // populate array with oscillators
  notes = new Oscil[COUNT][COUNT];
  for (int i = 0; i < notes.length; i++) {
    for (int j = 0; j < notes[i].length; j++) {
      notes[i][j] = new Oscil((FUNDAM + DIST * i) * (j + 8) + random(INHARMON), 1./pow(notes.length, 2), Waves.SINE);
    }
  }
  
  // L/R channels
  left.patch(panL);
  right.patch(panR);  
  
  // panning
  panL.patch(mix);
  panR.patch(mix);
  
  // mix to audio output
  mix.patch(dac);
  
  // patch oscilators to L/R channels
  for (int i = 0; i < notes.length; i++) {
    for (int j = 0; j < notes[i].length; j++) {
      delay(DELAY);
      if (j % 2 == 0) {
        notes[i][j].patch(left);
      } else {
        notes[i][j].patch(right);
      }
    }
  }
}

void draw () {
  // nothing here, but necessary for running the program
}
