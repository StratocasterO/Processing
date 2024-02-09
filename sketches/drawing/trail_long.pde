void trailL() {
  fill(0, 10);
  strokeWeight(0);
  rect(0,0, width, height);
  stroke(#DDDDDD);
  strokeWeight(4);
  line(pos, 20, pos, 580);
  pos = pos + sign;
  if (pos == width || pos == 0) {
   sign *= -1;
  }
}
