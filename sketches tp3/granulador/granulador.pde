/*  INSTRUCTIONS: open and run pd~ granulator, open and run this GUI program
    and click "connect 127.0.01". Make sure you are recieving data and printing
    it to the console. You're ready to go!                                         */

import g4p_controls.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

GKnob rate, size, random, gain;
GSlider position;

PImage ona;
int pos, dur;

void setup() {
  size(800,425);
  frameRate(25);
  
  // receiver and sender
  oscP5 = new OscP5(this,12001);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
  
  // controls
  position = new GSlider(this, 10, 195, 780, 80, 30);
  rate = new GKnob(this, 190, 290, 80, 80, 1.0);
  size = new GKnob(this, 310, 290, 80, 80, 1.0);
  random = new GKnob(this, 430, 290, 80, 80, 1.0);
  gain = new GKnob(this, 600, 290, 80, 80, 1.0);
  
  // initialize
  init();

  ona = loadImage("ona.png");
}

void draw() {
  background(0);  
  image(ona, 10, 10, 780, 200);
  
  stroke(255,0,0);
  strokeWeight(3);
  fill(250,0,0,40);
  rect(10 + pos, 10, dur, 199);
  
  stroke(255,255,255);
  fill(0,0,0,0);
  rect(170,270,360,135,10,10,10,10);
  
  fill(255,255,255);
  text("Position", 20, 265);
  text("Rate", 220, 385);
  text("Duration", 330, 385);
  text("Randomness", 439, 385);
  text("Gain", 630, 385);
}

// testing P5 to PD
void mousePressed() {
  OscMessage myMessage = new OscMessage("/test"); 
  myMessage.add((int)random(3000));
  oscP5.send(myMessage, myRemoteLocation); 
}

// testing PD to P5
void oscEvent(OscMessage msg) {
  //msg.print();
  pos = (int)(msg.get(0).floatValue()*780/3000.);
  dur = (int)(msg.get(1).floatValue()*780/3000.);
}

// map slider to position 
public void handleSliderEvents(GValueControl slider, GEvent event) {
  //println(slider.getValueF());
  OscMessage myMessage = new OscMessage("/position"); 
  myMessage.add(slider.getValueF() * 2800.);
  oscP5.send(myMessage, myRemoteLocation); 
}

// map knobs to rate, size and randomness in the position of the grain
public void handleKnobEvents(GValueControl knob, GEvent event) {
  if (knob == rate) {
    //println("rate", knob.getValueF());
    OscMessage myMessage = new OscMessage("/period"); 
    myMessage.add(5 + knob.getValueF() * 495);
    oscP5.send(myMessage, myRemoteLocation); 
    
  } else if (knob == size) {
    //println("size", knob.getValueF());
    OscMessage myMessage = new OscMessage("/duration"); 
    myMessage.add(20 + knob.getValueF() * 480);
    oscP5.send(myMessage, myRemoteLocation); 
    
  } else if (knob == random) {
    //println("random", knob.getValueF());
    OscMessage myMessage = new OscMessage("/positionvar"); 
    myMessage.add(20 + knob.getValueF() * 480);
    oscP5.send(myMessage, myRemoteLocation); 
  
  } else if (knob == gain) {
    //println("random", knob.getValueF());
    OscMessage myMessage = new OscMessage("/gain"); 
    myMessage.add(knob.getValueF());
    oscP5.send(myMessage, myRemoteLocation); 
  }
}

void init() {
  position.setValue(.25);
  rate.setValue(.05);
  size.setValue(.4);
  random.setValue(.02);
  gain.setValue(.3);
  
  OscMessage myMessage = new OscMessage("/gain"); 
  myMessage.add(gain.getValueF());
  oscP5.send(myMessage, myRemoteLocation); 
  
  myMessage = new OscMessage("/positionvar"); 
  myMessage.add(20 + random.getValueF() * 480);
  oscP5.send(myMessage, myRemoteLocation); 
  
  myMessage = new OscMessage("/duration"); 
  myMessage.add(20 + size.getValueF() * 480);
  oscP5.send(myMessage, myRemoteLocation); 
  
  myMessage = new OscMessage("/period"); 
  myMessage.add(5 + rate.getValueF() * 495);
  oscP5.send(myMessage, myRemoteLocation); 
  
  myMessage = new OscMessage("/position"); 
  myMessage.add(position.getValueF() * 3200.);
  oscP5.send(myMessage, myRemoteLocation); 
}
