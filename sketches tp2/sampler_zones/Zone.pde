public class Zone {
    Sampler sampler;
    Gain gain;
    int lowKey, highKey, root;
    int lowVel, highVel;
    float vol, tune;
    MySampler mySampler;

    Zone (String path, String lowKey, String highKey, String root, int lowVel, int highVel, float vol, float tune, MySampler mySampler, Minim minim) {
        this.mySampler = mySampler;
        sampler = new Sampler(path, 4, minim);
        gain = new Gain(vol);

        // transforms notes to frequencies
        this.lowKey = round(Frequency.ofPitch(lowKey).asMidiNote());
        this.highKey = round(Frequency.ofPitch(highKey).asMidiNote());
        this.root = round(Frequency.ofPitch(root).asMidiNote());
        
        this.lowVel = lowVel;
        this.highVel = highVel;
        this.vol = vol;
        this.tune = tune;

        sampler.patch(gain).patch(out);
    }

    public void noteOn(int key, int vel) {
        // TODO afegir volums
        float retune = (float)Math.pow(2,-(key - this.root)/12.0); 
        sampler.setSampleRate(48000*retune); //ep,48000 si les mostres són a 48k…
        sampler.trigger();
    }
}
