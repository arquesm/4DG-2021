PFont myfont;
String al="l i v e a l c o d e ";
int i;
int c;
void setup() {
  myfont=createFont("GT-Zirkon-Bold-Trial.otf", 32);
  size(600, 600);
}
void draw() {
  background(#f1f1f1);
  fill(0);  
  textFont(myfont);


  float fontSize = 190;
  float lineHeight = fontSize * 1.45;
  textSize(fontSize);
  textAlign(LEFT, TOP);


  push();
  noFill();
  stroke(0, 255, 255);
  strokeWeight(10);
  text(al.toUpperCase(), -frameCount, 20);
  pop();

  fill(0);
  rect(0, height/3, width, height/3);

  fill(#f1f1f1);
  push();
  text(al.toUpperCase(), -frameCount*2, -50+lineHeight);
  pop();
  fill(0);
  push();
  text(al.toUpperCase(), -frameCount*3, -120+lineHeight+lineHeight);
  pop();
}
