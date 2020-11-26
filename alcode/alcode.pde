int c;
int cc=0;
boolean contador=true;
String la="l i v e a l c o d e";
void setup() {
  size(500, 500, P3D);
  //fullScreen();
  noFill();
  strokeWeight(8);
  stroke(255);
}
void draw() {

  textSize(50);
  textAlign(CENTER);
  background(0);
  if (cc==la.length()+100) {
    contador=false;
  } 
  if (cc==0) {
    contador=true;
  }

  if (contador==true) {
    c=1;
  } else {
    c=-1;
  }
  cc=cc+c;
  println(cc);
  push();
  translate(width/2, height/2);
  for (int y=1; y<height; y=y+80) {
    float m= map(cc, 0, la.length()+100, 0, la.length()-1);
    int mm;
    mm=int(m);
    println(mm);
    text(la.substring(mm, la.length()), cos(frameCount*0.009)*y, tan(frameCount*0.009)*y);
    ellipse(sin(frameCount*0.05)*y, tan(frameCount*0.05)*y, width/4, width/10);
  }
  pop();
}
