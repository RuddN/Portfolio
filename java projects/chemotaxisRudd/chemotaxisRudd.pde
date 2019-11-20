Mouse[] mice = new Mouse[10];
Interactor hand;
PImage mouse, cheese, cat, background;
//vector images from vecteezy.com
int spawnX, spawnY;
boolean good;
void setup()   
{     
  size(800, 500);
  background(0, 0, 0);
  mouse = loadImage("rodent.png");
  cheese = loadImage("cheese.png");
  cat = loadImage("cat.png");
  background = loadImage("background.jpg");
  for (int i=0; i<mice.length; i++) {
    spawnX=(int)(Math.random()*650)+50;
    spawnY=(int)(Math.random()*400)+50;
    mice[i] = new Mouse(i, spawnX, spawnY);
  }
  hand = new Interactor(400, 250);
  good=true;
}   
void draw()   
{    
  background(0, 0, 0);
  image(background, 0, 0, 800, 500);
  for (int i=0; i<mice.length; i++) {
    mice[i].exist();
    mice[i].move();
  }

  hand.exist();
  hand.move();
  textSize(22);
  if (good){
    text("Click to Chase", 560, 50);
  } else {
    text("Click to Tempt", 560, 50);
  }
}  
void mouseClicked() {
  if (good) {
    good=false;
  } else {
    good=true;
  }
}
class Mouse    
{     
  float x, y;
  int size;
  int tag;
  float speedx, speedy;

  public Mouse(int tag, float x, float y) {
    this.x=x;
    this.y=y;
    this.tag=tag;
  }

  public void exist() {
    image(mouse, x, y);
  }

  public void exist(float x, float y) {
    this.x=x;
    this.y=y;
    exist();
  }

  public void move() {
    speedx=(float)(Math.random()*9000/900000);
    speedy=(float)(Math.random()*9000/900000);
    //speedx=0.01;
    //speedy=0.01;
    if(x<=0&&x>=700)
     speedx=0;
    if(y<=0&&y>=432)
     speedy=0;
    if (good) {
      float xDist = hand.x - x;
      x+=(xDist*speedx);
      float yDist = hand.y - y;
      y+=(yDist*speedy);
      speedx=(float)(Math.random()/100);
      speedy=(float)(Math.random()/100);
    } else {
      float xDist = hand.x - x;
      x-=xDist*speedx;
      float yDist = hand.y - y;
      y-=yDist*speedy;
      speedx=(float)(Math.random()/100);
      speedy=(float)(Math.random()/100);
    }
  }
}    
class Interactor    
{     
  float x, y;
  int size;
  float speed=0.2;

  public Interactor(float x, float y) {
    this.x=x;
    this.y=y;
  }

  public void exist() {
    if (good) {
      image(cheese, x, y);
    } else {
      image(cat, x, y);
    }
  }

  public void exist(float x, float y) {
    this.x=x;
    this.y=y;
    exist();
  }

  public void move() {
    float xDist = mouseX - x;
    x += xDist * speed;

    float yDist = mouseY - y;
    y += yDist * speed;
  }
}    
