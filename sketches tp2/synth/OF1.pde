class OF1 implements Instrument {
  Oscil vco1;
  Oscil vco2;
  Oscil vco3;
  Oscil sub;
  Summer mix;
  ADSR adsr;
  
  OF1(float freq) {
    adsr = new ADSR(1, .05, .5, 1, .5); // (gain, A, D, S, R)
    mix = new Summer();
    vco1 = new Oscil(freq, .4, Waves.SAW);
    vco2 = new Oscil(freq * 3/2, .2, Waves.SAW);
    vco3 = new Oscil(freq * 5/4, .1, Waves.SAW);
    sub = new Oscil(freq / 2, .3, Waves.SINE);
    
    vco1.patch(mix);
    vco2.patch(mix);
    vco3.patch(mix);
    sub.patch(mix);
    mix.patch(adsr);
    adsr.patch(out);
  }
  
  void noteOn(float freq) {
    adsr.noteOn();
  }

  void noteOff() {
    adsr.noteOff();
  }
}
