String al="l i v e a l c o d e ";
PFont myfont;

color bg = #000000;
color fg = #f1f1f1;
PFont font;

void setup() {
  size(1920, 1080, P3D);
  myfont=createFont("GT-America-Mono-Medium-Trial.otf", 1500);

  imageMode(CENTER);
}

void draw() {
  textFont(myfont);

  background(0);
  perspective(PI/3.0, (float)width/height, 1, 100000);

  float range = 2400;
  float eyeX = width/2.0 + map(mouseX, 0, width, -range, range);
  float eyeY = height/2.0  + map(mouseY, 0, height, -range, range);
  float eyeZ =(height/2.0) / tan(PI*30.0 / 180.0) + 400;
  float centerX = width/2.0;
  float centerY = height/2.0;
  float centerZ = 0;
  float upX = 0;
  float upY = 1;
  float upZ = 0;
  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  fill(fg);
  push();
  textFont(myfont);
  textAlign(LEFT, CENTER);
  textSize(1700);
  float w = textWidth(al);
  String txtUp = al.toUpperCase();
  translate(-frameCount * 100, 500, 0);
  float wave = map(sin(radians(frameCount)), -1, 1, -7, 7);
  text(txtUp, 0, 0);
  pop();
}
