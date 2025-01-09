import ddf.minim.UGen;

public class Gain3 extends UGen {
  public UGenInput audio;
  public UGenInput gain;
  private float mValue;
  private float lastValue;

  public Gain3() {
    this(0.f);
  }

  public Gain3(float value) {
    mValue = value;
    lastValue = 0;

    audio = new UGenInput(InputType.AUDIO);
    gain = new UGenInput(InputType.CONTROL);
  }

  public void setValue(float value) {
    mValue = value;
  }

  @Override
    protected void uGenerate(float[] channels) {
    if (gain.isPatched()) {
      mValue = gain.getLastValue();
    }

    for (int i = 0; i < channels.length; ++i) {
      channels[i] = (1 - mValue) * audio.getLastValues()[i] + mValue * this.lastValue;
      this.lastValue = channels[i];
    }
  }
}
