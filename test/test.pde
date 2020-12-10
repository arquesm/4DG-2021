import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;
BeatDetect beat;

color cian=color(10, 160, 250);
color rosa=color(240, 40, 0);
color groc=color(200, 230, 20);

float eRadius;
float wave;

FFT fft;
SineWave sine;
float[] buffer;
int bsize = 512;

void setup() {
  size(500, 500, P3D);
  minim = new Minim(this);
  in= minim.getLineIn(Minim.STEREO, 1024);
  beat= new BeatDetect();
  beat.setSensitivity(100);
}
void draw() {
  beat.detect(in.mix);
  
  noStroke();
  ellipseMode(CORNER);
  wave= sin(frameCount*0.005)*4;
  for (int i=0; i<width; i=i+width/5) {
    for (int y=0; y<width; y=y+width/5) {
      push();
      if (beat.isOnset()) {
        fill(rosa);
      }
      fill(groc);
      translate(width/2, height/2);
      rotate(wave);
      rect(0, 0, wave, height/2);
      pop();
      push();
      fill(cian);
      //rotate(radians(i));
      translate(0, 0);
      ellipse(i, y, width/6+in.mix.get(i)*1500, width/6+in.mix.get(i)*500);
      pop();
    }
  }
}
