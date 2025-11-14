import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
ArrayList<Boundary> bounds;
Boundary bound, bound2;

int x,y;

Box2DProcessing box2d;    

void setup() {
  size(800,600);
  smooth();
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  bounds = new ArrayList<Boundary>();
  
  //bounds.add(new Boundary(400,550,700,0,0.5));
  //bounds.add(new Boundary(400,500,100,0,4.0));
}

void draw() {
  background(255);
  fill(0);
  text("Arrossega el ratolí per crear parets\nPrem l'espai del tecalat per crear partícules a la posició del ratolí\nFes clic dret per eliminar les parets", 10, 10);
  
  // avança la simulació
  box2d.step();    

  // mostra les caixes
  for (Box b: boxes) {
    b.display();
  }
  
  for (Boundary bound: bounds) {
    bound.display();
  }
}

void keyPressed(){
  if (keyCode == 32) {
    Box p = new Box(mouseX, mouseY, (int)random(180,255), 200, 200);
    boxes.add(p);
  }
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
}

void mouseReleased(){
  bounds.add(new Boundary((x+mouseX)/2,(y+mouseY)/2,abs(mouseX-x),abs(mouseY-y),.8));
}

void mouseClicked(){ 
  if (mouseButton == RIGHT) {
    for(Boundary b: bounds) {
      b.done();
    }
    bounds = new ArrayList<Boundary>();
  }
}

class Box {  
  Body body;      
  float w,h;
  int r, g, b;

  Box(float x, float y, int r, int g, int b) {
    w = random(5,5);
    h = random(5,5);
    this.r = r;
    this.g = g;
    this.b = b;

    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));
    body.setAngularVelocity(random(-1,1));

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);        
    strokeWeight(.5);
    fill(this.r, this.g, this.b);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h,2);
    popMatrix();
  }
}

class Boundary {
  float x,y;
  float w,h;

  Body body;
  
  boolean done(){
    box2d.destroyBody(body);
    return true;
  }
 
  Boundary(float x_,float y_, float w_, float h_, float rest) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
 
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);
 
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2dW, box2dH);
 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = rest;
 
    body.createFixture(fd);

  }

  void display() {
    fill(230);
    stroke(0);
    strokeWeight(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
 
}
