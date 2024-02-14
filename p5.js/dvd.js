function setup() {
  createCanvas(1200, 800);
  background(0);
  font = loadFont('./Quicksand.ttf');
  textFont(font);
  textSize(64);
  
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
  x_max = 1075;
  y_max = 692;
  x = 500;
  y = 370;
  x_e = 584;
  y_e = 390;
  speed_x = random(2,3);
  speed_y = random(1,1.5);
  fps = 60;
}

function draw() {
  background(0);

  if (x_e > x_max || x_e < 125) {
    speed_x *= -1; 
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
  }
  if (y_e > y_max || y_e < 100) {
    speed_y *= -1; 
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
  }
  
  fill(r, g, b);
  ellipse(x_e, y_e, 250, 200);
  fill(0);
  text(" hello\nworld", x, y);
    
  x += speed_x;
  y += speed_y;
  
  x_e += speed_x;
  y_e += speed_y;
}
     
function keyPressed() {  
  if (key == ' ') {
    if (fps == 30) {
      fps = 60;
    } else if (fps == 60) {
      fps = 120;
    } else {
      fps = 30;
    }
    
    frameRate(fps);
    
    console.log(fps);
  }
}