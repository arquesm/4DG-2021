import processing.opengl.*;

ArrayList arcos = new ArrayList();

color fondo = color(255,255,255);

boolean clearScreen = true ; 

void setup()
{
 size(600,600, OPENGL);
 frameRate(60);

 noSmooth();  
 
 //noStroke();
 
 for( int i = 0 ; i < 20 ; i ++ )
 {
   Arco b = new Arco( (int)( random(width)/2.0 ) );
   b.randSpeed();
   b.randColor();
   b.offsetX = (int)(width / 2);
   b.offsetY = (int)(height / 2);
   arcos.add( b );     
 }
 
}

void draw()
{

  background( fondo );  
  lights();

  if( mousePressed )
  {
    translate( mouseX , mouseY ) ;
  } else
  {
    translate(width / 2, height / 2);
  }
  
  noStroke();
  
  beginShape(TRIANGLES);
  
  for( int i = 0 ; i < arcos.size(); i++ ) 
  {
     Arco b = (Arco)arcos.get(i);
     b.actualizarPosicion();     
     b.dibujar();
  }
  
  endShape();
  
//  rotateY(frameCount * PI/100);

  
}

void mousePressed()
{
  fondo = color(255,255,255);
}

void setRandColors()
{
  for( int i = 0 ; i < arcos.size(); i++ ) 
  {
     Arco b = (Arco)arcos.get(i);
     b.randColor();
  }

}

void setRandRadiosGiro()
{
  for( int i = 0 ; i < arcos.size(); i++ ) 
  {
     Arco b = (Arco)arcos.get(i);
     b.randRadioGiro();
  }     
}

void setRandRadios()
{
  for( int i = 0 ; i < arcos.size(); i++ ) 
  {
     Arco b = (Arco)arcos.get(i);
     b.randRadio();
  }     
}

void setRandSpeeds()
{
  for( int i = 0 ; i < arcos.size(); i++ ) 
  {
     Arco b = (Arco)arcos.get(i);
     b.randSpeed();
  }     
}


void keyPressed()
{
  if( keyCode == KeyEvent.VK_C ) 
  {
    setRandColors();
  } else if( keyCode == KeyEvent.VK_B )
  {
    fondo = color( random(255), random(255), random(255) );
  } else if( keyCode == KeyEvent.VK_V )
  {
    setRandSpeeds();
  } else if ( keyCode == KeyEvent.VK_A )
  {
    
    Arco b = new Arco((int)( random(width)/2.0 ));
    b.offsetX = (int)(width / 2);
    b.offsetY = (int)(height / 2);

    b.randSpeed();
    b.randColor();
    b.randRadioGiro();
    b.randRadio();
    
    arcos.add( b );
    
  } else if ( keyCode == KeyEvent.VK_Z )
  {
    
    if( arcos.size() > 1 )
    {
      arcos.remove( arcos.get(0) );
    }
    
  } else if ( keyCode == KeyEvent.VK_T )
  {
//    clearScreen =  !clearScreen ;
  } else if ( keyCode == KeyEvent.VK_G )
  {
    setRandRadiosGiro();
  } else if ( keyCode == KeyEvent.VK_R )
  {
    setRandRadios();
  }
  
  
  
}
  
  
class Arco
{

  float anguloActual = 0.0 ;

  float anguloCentral = PI / 30.0 ; 
  
  float velocidad = 0.001 ; // rad por frame  
  
  int radio = 10 ;
  
  int radioDeGiro = 50 ; 
  
  int x = 0 ; 
  
  int y = 0 ;  
  
  int x1 = 0 ;
  
  int y1 = 0 ;
  
  int offsetX = 0 ;
  int offsetY = 0 ;
  
  color frente = color(125,125,125);
  
  void randRadioGiro()
  {
    radioDeGiro = (int)( random(width)/2.0 ) ;    
  }
  
  void randRadio()
  {
    //radio = (int)( random(width)/25.0 ) ; 
    anguloCentral = PI / 30.0 + random( PI / 4.0 ); 
  }
  
  Arco( int pRadio )
  {
    radioDeGiro = pRadio ;
  }
 
  void randColor()
  {
    frente = color( random(255), random(255), random(255) );
  }
  
  void randSpeed()
  {
    setVelocidad( random( 50 * 0.001 ) * pow( -1 , (int)random(100) ) ) ;
  }
  
  void setVelocidad( float pV )
  {
    velocidad = pV ; 
  }
  
  void dibujar()
   {

    fill( frente );     

    vertex( 0 , 0 , 0 );
    vertex( x , y , 0 ) ;
    vertex( x1 , y1 , 0 ) ;
     
   } 
   
  void actualizarPosicion()
  {    
    
     anguloActual += velocidad ;
    
     x = int( radioDeGiro * cos( anguloActual ) ) ;
     y = int( radioDeGiro * sin( anguloActual ) ) ;

     x1 = int( radioDeGiro * cos( anguloActual + anguloCentral ) ) ;
     y1 = int( radioDeGiro * sin( anguloActual + anguloCentral ) ) ;
    
  }
  
}
