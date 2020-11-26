PFont myfont;
String al=" l i v e a l c o d e";
int i=0;
void setup() {
  myfont=createFont("GT-Zirkon-Bold-Trial.otf", 32);
  size(500, 500);
}
void draw() {
  background(0);
  textFont(myfont);
  textSize(22);
  fill(255);
  textAlign(CENTER);
stroke(255);
  i=0;
  for (int y=30; y<height-30; y=y+20) {
    for (int x=30; x<width-30; x=x+20) {
      if ( i<al.length() ) {
        i=i+1;
        println(i);
        push();
        translate(x, y);
        rotate(sin(frameCount*0.001)*x%10);
        text(al.substring(i-1, i), 0, 0);
        pop();
      } else {
        i=0;
      }
    }
  }
}
