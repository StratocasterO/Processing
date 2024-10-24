class OF1 implements Instrument {
  Oscil vco1;
  Oscil vco2;
  Oscil vco3;
  Oscil sub;
  Summer mix;
  ADSR adsr;
  MoogFilter vcf;

  float freq;

  Wavetable w1, w2, w3, wsub;
  float f1, f2, f3, fsub;
  float a1, a2, a3, asub;
  float aTotal;
  float a, d, s, r;
  float cut, res;

  OF1(float freq, int preset) {
    adsr = new ADSR(1, .01, 0, 1, .1); // (gain, A, D, S, R)
    mix = new Summer();
    vco1 = new Oscil(freq, 0, Waves.SAW);
    vco2 = new Oscil(freq, 0, Waves.SAW);
    vco3 = new Oscil(freq, 0, Waves.SAW);
    sub = new Oscil(freq, 0, Waves.SINE);
    vcf = new MoogFilter(10000, 0, MoogFilter.Type.LP);

    vco1.patch(mix);
    vco2.patch(mix);
    vco3.patch(mix);
    sub.patch(mix);
    mix.patch(vcf);
    vcf.patch(adsr);
    adsr.patch(out);

    this.freq = freq;
    
    // supersaw
    if (preset == 1) setPreset(Waves.SAW, Waves.SAW, Waves.SAW, Waves.SAW,
                               1, 1.01, 0.99, 0, 5, 4, 4, 0,
                               .01, 0, 1, 1, 8000, .8);
    // bass
    else if (preset == 2) setPreset(Waves.TRIANGLE, Waves.SAW, Waves.SAW, Waves.SINE,
                                    1, 0, 0, 1/2, 5, 0, 0, 4,
                                    .01, 0, 1, .2, 2000, .4);
  }

  void setPreset(Wavetable w1, Wavetable w2, Wavetable w3, Wavetable wsub, 
  float f1, float f2, float f3, float fsub, float a1, float a2, float a3, float asub, 
  float a, float d, float s, float r, int cut, float res) {
    this.aTotal = f1 + f2 + f3 + fsub;

    vco1.setFrequency(freq * f1);
    vco1.setAmplitude(a1 / aTotal);
    vco1.setWaveform(w1);

    vco2.setFrequency(freq * f2);
    vco2.setAmplitude(a2 / aTotal);
    vco2.setWaveform(w2);

    vco3.setFrequency(freq * f3);
    vco3.setAmplitude(a3 / aTotal);
    vco3.setWaveform(w3);

    sub.setFrequency(freq * fsub);
    sub.setAmplitude(asub / aTotal);
    sub.setWaveform(wsub);

    vcf.frequency.setLastValue(cut);
    vcf.resonance.setLastValue(res);
    adsr.setParameters(1, a, d, s, r, 1.0, .0); // two last: gain before and after gate
  }

  void noteOn(float freq) {
    adsr.noteOn();
  }

  void noteOff() {
    adsr.noteOff();
  }
}
