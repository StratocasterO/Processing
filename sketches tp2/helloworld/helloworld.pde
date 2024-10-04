import ddf.minim.*;
import ddf.minim.ugens.*;

// first program with Minim

Minim min;
AudioOutput dac;
Oscil osc1, osc2;
Summer mix;

void setup() {
  println("Hello world");
  salute();
  println(salutacio("Omar"));
  
  // init Minim, audio output, oscillators and mixer
  min = new Minim(this);
  dac = min.getLineOut();
  mix = new Summer();
  osc1 = new Oscil(220, .5, Waves.SINE); 
  osc2 = new Oscil(330, .3, Waves.TRIANGLE); 
  
  // patch oscilltors to audio output
  mix.patch(dac);
  osc1.patch(mix);
  osc2.patch(mix);
}

void draw() {
  // executes 60 times per second
}

void salute() {
  // funció que no retorna res
  println("I'm a function saying 'hi'");
}

String salutacio(String nom) {
  // funció que retorna coses
  return "Hola, " + nom;
}
