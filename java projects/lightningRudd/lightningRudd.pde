int startX=((int)(Math.random()*800));
int startY=0;
int endX=((int)(Math.random()*800));
int endY=0;

PImage grass, hamster;

Raindrop[] rain=new Raindrop[15];

Flash[] flashes=new Flash[10];
Hamster hammy=new Hamster();

void setup()
{
  size(800, 500);
  strokeWeight(4);
  background(51, 56, 84);
  for(int i=0; i<rain.length; i++){
     rain[i]=new Raindrop();
  }
  for(int i=0; i<flashes.length; i++){
    flashes[i]=new Flash();
  }
  grass=loadImage("GrassSmol.png");
}

void draw()
{
  for(int i=0; i<flashes.length; i++){
    flashes[i].show();
    flashes[i].reset();
  }
  for (int i=0; i<rain.length; i++){
    rain[i].show();
    rain[i].move();
  }
  image(grass, 0, 384);
  image(grass, 500, 384);
  hammy.show();
  hammy.move();
}

public class Flash {

  void show() {
    stroke(255, 255, 204);
    while (endX<800) {
      endX=startX+((int)(Math.random()*80))-20;
      endY=startY+((int)(Math.random()*200));
      line(startX, startY, endX, endY);
      startX=endX;
      startY=endY;
    }

  }

  void reset() {
    startX=((int)(Math.random()*800));
    startY=0;
    endX=((int)(Math.random()*800));
    endY=0;
    setup();
    show();
  }
}

public class Hamster{
  int xval = 0;
  int yval = 310;
  int speed = 15;
   
   void show(){
     hamster=loadImage("hamstervsmolwbrella.png");
     image(hamster, xval, yval);
   }
   
   void move(){
     xval+=speed;
     if (xval<0 || xval>654){
       speed*=-1;
     }
   }
   
   int getX(){
      return xval; 
   }
   
   int getY(){
      return yval; 
   }
   
}

public class Raindrop{
  
  private int x, y;
  private int yspeed;
  private int size;
  
  public Raindrop(){
    x=(int)(Math.random()*801);
    y=(int)(Math.random()*501-10);
    yspeed=1;
    size=1;
  }
  
  void show() {
    fill(165, 207, 255);
    stroke(165,207,255);
    //ellipse(x, y, size, size);
    line(x, y, x, y+10);
  }
  
  void move() {
    y+=yspeed;
    if (y>500){
      y=-20;
      x=(int)(Math.random()*801);
    }
  }
}
