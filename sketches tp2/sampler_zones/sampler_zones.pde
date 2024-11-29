import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MySampler sampler;
Zone z1, z2, z3, z4, z5, z6;

void setup() {
  // init
  minim = new Minim(this);
  out = minim.getLineOut();
  MySampler sampler = new MySampler();

  // Zone (String path, String lowKey, String highKey, String root, int lowVel, int highVel, float vol, float tune, MySampler mySampler, Minim minim)
  // 6 zones: G2, C3, G3, C4, G4, C6
  z1 = new Zone("HK Vibraphone-02-G2.AIF", "C2", "A2", "G2", 0, 127, -6, 0, sampler, minim);
  z2 = new Zone("HK Vibraphone-05-C3.AIF", "Bb2", "Eb3", "C3", 0, 127, -6, 0, sampler, minim);
  z3 = new Zone("HK Vibraphone-09-G3.AIF", "E3", "A4", "G3", 0, 127, -6, 0, sampler, minim);
  z4 = new Zone("HK Vibraphone-12-C4.AIF", "Bb3", "Eb4", "C4", 0, 127, -6, 0, sampler, minim);
  z5 = new Zone("HK Vibraphone-16-G4.AIF", "E4", "A5", "G4", 0, 127, -6, 0, sampler, minim);
  z6 = new Zone("HK Vibraphone-19-C5.AIF", "Bb4", "Eb5", "C5", 0, 127, -6, 0, sampler, minim);

  sampler.addZone(z1);
  sampler.addZone(z2);
  sampler.addZone(z3);
  sampler.addZone(z4);
  sampler.addZone(z5);
  sampler.addZone(z6);
  
  sampler.noteOn("C3", 60);
  delay(500);
  sampler.noteOn("D3", 60);
  delay(500);
  sampler.noteOn("E3", 60);
  delay(500);
  sampler.noteOn("F3", 60);
  delay(500);
  sampler.noteOn("G3", 60);
  delay(500);
  sampler.noteOn("A3", 60);
  delay(500);
  sampler.noteOn("B3", 60);
  delay(500);
  sampler.noteOn("C4", 60);
  delay(500);
  sampler.noteOn("D4", 60);
  delay(500);
  sampler.noteOn("E4", 60);
  delay(500);
  sampler.noteOn("F4", 60);
}

void draw() {

}
