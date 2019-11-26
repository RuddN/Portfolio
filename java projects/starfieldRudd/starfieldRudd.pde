int clrScheme, numJumbo;
float spawnX, spawnY;
PImage jupiter,sun;
NormalParticle[] pieces = new NormalParticle[100];
OddballParticle[] shinies = new OddballParticle[5];
TinyParticle[] stars = new TinyParticle[200];

void setup() {
  size(500, 500);
  background(0);
  numJumbo=5;
  //clrScheme=(int)(Math.random()*3)+1;
  clrScheme=3;
  spawnX=0;
  spawnY=0;
  jupiter=loadImage("jupiter.png");
  sun=loadImage("sun.png");
  for (int i = 0; i<(pieces.length-numJumbo); i++) {
    pieces[i]=new NormalParticle(spawnX, spawnY, 10);
  }
  for (int i = 0; i<shinies.length; i++) {
    shinies[i]=new OddballParticle(spawnX, spawnY);
  }
  for (int i = (pieces.length-numJumbo); i<pieces.length; i++) {
    pieces[i]=new JumboParticle(spawnX, spawnY);
  }
  for (int i = 0; i<stars.length; i++) {
    stars[i]=new TinyParticle(spawnX, spawnY);
  }
}
void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i<stars.length; i++) {
    stars[i].show();
    stars[i].move();
  }
  for (int i = 0; i<pieces.length; i++) {
    pieces[i].show();
    pieces[i].move();
  }
  for (int i = 0; i<shinies.length; i++) {
    shinies[i].show();
    shinies[i].move();
  }
  image(sun, spawnX-25, spawnY-25);
  image(jupiter,mouseX-(width/2)-18,mouseY-(height/2)-15);
  fill(255,255,255);
  textSize(18);
  text("*Click to change Gravitational Center*", -(width/2)+85, (height/2)-20);
}
void mousePressed() {
  spawnX=mouseX-(width/2);
  spawnY=mouseY-(height/2);
  for (int i = 0; i<pieces.length; i++) {
    pieces[i].show(spawnX,spawnY);
    pieces[i].move();
  }
  for (int i = 0; i<shinies.length; i++) {
    shinies[i].show(spawnX, spawnY);
    shinies[i].move();
  }
}

interface Particle {
  public void show();
  public void move();
}

class NormalParticle {
  float x, y, speed, angle;
  int fixedclr, clr2, clr3, size;

  NormalParticle(float xpos, float ypos, int size) {
    x=xpos;
    y=ypos;
    this.size=size;
    speed=random(15);
    angle=random(2*PI);
    fixedclr=100;
    clr2=(int)(Math.random()*255)+1;
    clr3=(int)(Math.random()*255)+1;
  }

  public void move() {
    x+=(cos(angle)*speed);
    y+=(sin(angle)*speed);
    angle+=0.05;
  }

  public void show() {
    noStroke();
    if (clrScheme==1)
      fill(fixedclr, clr2, clr3);
    else if (clrScheme==2)
      fill(clr2, fixedclr, clr3);
    else
      fill(clr2, clr3, fixedclr);    
    ellipse(x, y, size, size);
  }
  void show(float xpos, float ypos) {
    x=xpos;
    y=ypos;
    show();
  }
}

class OddballParticle implements Particle
{
  float x, y, speed, angle;
  PImage shiny;

  OddballParticle(float xpos, float ypos) {
    x=xpos;
    y=ypos;
    speed=random(7)+3;
    angle=random(2*PI);
    shiny=loadImage("stars.png");
  }

  void move() {
    x+=(cos(angle)*speed);
    y+=(sin(angle)*speed);
    angle+=0.05;
    speed=random(7)+3;
  }

  void show() {
    image(shiny, x, y);
  }

  void show(float xpos, float ypos) {
    x=xpos;
    y=ypos;
    show();
  }
}

class JumboParticle extends NormalParticle
{
  JumboParticle(float xpos, float ypos) {
    super(xpos, ypos, 25);
  }
}

class TinyParticle extends NormalParticle
{
  TinyParticle(float xpos, float ypos) {
    super(xpos, ypos, 2);
    angle=random(4*PI);
  }
  public void move() {
    x+=(cos(angle)*speed);
    y+=(sin(angle)*speed);
    angle+=0.03;
    speed=random(7);
  }
  public void show(){
    noStroke();
    fill(255,255,255);
    ellipse(x,y,size,size);
  }
}
