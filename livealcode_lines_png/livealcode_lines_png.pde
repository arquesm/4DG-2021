import processing.opengl.*;

color[] paleta={color(175, 0, 250), color(255, 242, 0), color(0)};
ArrayList arcos = new ArrayList();
color fondo = color(255, 255, 255);
boolean clearScreen = true ; 

void setup() {
  background(paleta[1], 8.9);  
  size(600, 600, OPENGL);

  frameRate(60);
  noSmooth();  
  strokeWeight(60);
  //noStroke();
  for ( int i = 0; i < 20; i ++ ) {
    Arco b = new Arco( int(random(width/2.0)));
    b.randSpeed();
    b.randColor();
    b.offsetX = (int)(width / 2);
    b.offsetY = (int)(height / 2);
    arcos.add( b );
  }
}

void draw() {


  lights();

  if ( mousePressed ) {
    translate( mouseX, mouseY ) ;
  } else {
    translate(width / 2, height / 2);
  }
  noStroke();

  beginShape(LINES);
  for ( int i = 0; i < 20; i++ ) {
    Arco b = (Arco)arcos.get(i);
    b.actualizarPosicion();     
    b.dibujar();
  }
  endShape();
  rotateY(frameCount * PI/100);
  saveFrame("livealcode_img"+"###"+".png");
}

void mousePressed() {
  fondo = color(255, 255, 255);
}

void setRandColors() {
  for ( int i = 0; i < arcos.size(); i++ ) {
    Arco b = (Arco)arcos.get(i);
    b.randColor();
  }
}

void setRandRadiosGiro() {
  for ( int i = 0; i < arcos.size(); i++ ) {
    Arco b = (Arco)arcos.get(i);
    b.randRadioGiro();
  }
}

void setRandRadios() {
  for ( int i = 0; i < arcos.size(); i++ ) {
    Arco b = (Arco)arcos.get(i);
    b.randRadio();
  }
}

void setRandSpeeds() {
  for ( int i = 0; i < arcos.size(); i++ ) {
    Arco b = (Arco)arcos.get(i);
    b.randSpeed();
  }

}


void keyPressed() {
  if ( keyCode == CODED ) {
    setRandColors();
  } else if ( keyCode == UP ) {
    fondo = color( random(255), random(255), random(255) );
  } else if ( keyCode == DOWN ) {
    setRandSpeeds();
  } else if ( keyCode == RIGHT ) {
    Arco b = new Arco(width);
    b.offsetX = width ;
    b.offsetY = height ;

    b.randSpeed();
    b.randColor();
    b.randRadioGiro();
    b.randRadio();
    arcos.add( b );
  }
}


class Arco {

  float anguloActual = 0.0 ;
  float anguloCentral = PI / 5.0 ; 
  float velocidad = 0.001 ; // rad por frame  
  int radio = 360 ;
  int radioDeGiro = 360 ; 

  int x = 0 ; 
  int y = 0 ;  
  int z = 0 ;
  int x1 = 0 ;
  int y1 = 0 ;
  int z1 = 0 ;


  int offsetX = 10 ;
  int offsetY = 10 ;

  color frente = color(125, 125, 125);

  void randRadioGiro() {
    //radioDeGiro = (int)( random(width)/2.0 ) ;
    radioDeGiro = width;
  }

  void randRadio() {
    //radio = (int)( random(width)/25.0 ) ; 
    //anguloCentral = PI / 5.0 + random( PI / 4.0 );
    anguloCentral = radians(360);
  }

  Arco( int pRadio ) {
    radioDeGiro = pRadio ;
  }

  void randColor() {
    //frente = color( random(255), random(255), random(255) );
    frente = paleta[int(random(paleta.length))];
  }

  void randSpeed() {
    setVelocidad( random( 20 * 0.001 ) * pow( -1, (int)random(100) ) ) ;
  }

  void setVelocidad( float pV ) {
    velocidad = pV ;
  }

  void dibujar() {
    stroke( frente );     
    vertex( 0, 0, 0 );
    vertex( x, y, 0 ) ;
    vertex( x1, y1, 0 ) ;
  } 

  void actualizarPosicion() {    

    anguloActual += velocidad ;

    x = int( radioDeGiro * cos( anguloActual ) ) ;
    y = int( radioDeGiro * sin( anguloActual ) ) ;

    x1 = int( radioDeGiro * cos( anguloActual + anguloCentral ) ) ;
    y1 = int( radioDeGiro * sin( anguloActual + anguloCentral ) ) ;

    /*z = int( radioDeGiro * sin( anguloActual + anguloCentral )) ;
     z1 = int( radioDeGiro * sin( anguloActual + anguloCentral )) ;*/
  }
}
