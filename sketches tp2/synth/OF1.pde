class OF1 implements Instrument {
  Oscil vco1;
  Oscil vco2;
  Oscil vco3;
  Oscil sub;
  Summer mix;
  ADSR adsr;
  MoogFilter vcf;

  OF1(float freq) {
    adsr = new ADSR(1, .01, 0, 1, .1); // (gain, A, D, S, R)
    mix = new Summer();
    vco1 = new Oscil(freq, .4, Waves.SAW);
    vco2 = new Oscil(freq * 1.035, .3, Waves.SAW);
    vco3 = new Oscil(freq * 0.97, .3, Waves.SAW);
    sub = new Oscil(freq / 2, .3, Waves.SINE);
    vcf = new MoogFilter(3000, 0.3, MoogFilter.Type.LP);

    vco1.patch(mix);
    vco2.patch(mix);
    vco3.patch(mix);
    sub.patch(mix);
    mix.patch(vcf);
    vcf.patch(adsr);
    adsr.patch(out);
  }

  void noteOn(float freq) {
    adsr.noteOn();
  }

  void noteOff() {
    adsr.noteOff();
  }
}
