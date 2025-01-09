import ddf.minim.UGen;

public class Gain2 extends UGen {
  public UGenInput audio;
  public UGenInput gain;
  private float mValue;

  public Gain2() {
    this(0.f);
  }

  public Gain2(float dBvalue) {
    mValue = (float)Math.pow(10.0, (0.05 * dBvalue));

    audio = new UGenInput(InputType.AUDIO);
    gain = new UGenInput(InputType.CONTROL);
  }

  public void setValue(float dBvalue) {
    mValue = (float)Math.pow(10.0, (0.05 * dBvalue));
  }

  @Override
    protected void uGenerate(float[] channels) {
    if (gain.isPatched()) {
      mValue=(float)Math.pow(10.0, (0.05*gain.getLastValue()));
    }

    for (int i = 0; i < channels.length; ++i) {
      // processat del senyal: es poden fer coses com wavefolding, limitació, distorsió, rectificació...
      // la tangent hiperbòlica és com una sigmoide entre -1 i 1 i fa soft clipping
      channels[i] = mValue * (float)Math.tanh(10 * audio.getLastValues()[i]);
    }
  }
}
