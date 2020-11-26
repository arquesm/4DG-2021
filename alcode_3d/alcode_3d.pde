import peasy.*;
PeasyCam cam;

int c;
int cc=0;
boolean contador=true;
String la="l i v e a l c o d e";
void setup() {
  //size(500, 500, P3D);

  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(700);
  cam.setMaximumDistance(1200);

  fullScreen(P3D);
  noFill();
  strokeWeight(8);
  stroke(255);
}
void draw() {
  textSize(50);
  textAlign(CENTER);
  background(0);
  push();
  translate(0, 0);
  for (int y=1; y<height; y=y+80) {
    rotateX(sin(frameCount*0.009));
    rotateY(cos(frameCount*0.009));
    rotateZ(sin(frameCount*0.009));
    translate(width/10-100, height/10, width/10);
    text(la, cos(frameCount*0.009)*y, sin(frameCount*0.005)*y, sin(frameCount*0.005)*y);
  }
  pop();
}
