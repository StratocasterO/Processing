import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MySampler sampler;

void setup() {
  // init
  minim = new Minim(this);
  out = minim.getLineOut();
  MySampler sampler = new MySampler();
}

void draw() {

}
