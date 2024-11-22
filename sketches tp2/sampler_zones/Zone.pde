import brave.sampler.Sampler;
public class Zone {
    MySampler sampler;
    Gain gain;
    int lowK, highK, root;
    int lowV, highV;
    float vol, tune;

    Zone (String path, String lowK, String highK, String root, int lowV, int highV, float vol, float tune, Sample sampler, Minim minim) {
        sampler = new Sampler(path, 1, minim);
        gain = new Gain();
        
        this.lowK = lowK;
        this.highK = highK;
        this.root = root;
        this.lowV = lowV;
        this.highV = highV;
        this.vol = vol;
        this.tune = tune;

        sampler.patch(gain).patch(out);
    }

    public void noteOn(int key, int vel) {
        sample.trigger();
    }
}
