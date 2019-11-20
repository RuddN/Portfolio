int clrScheme;
float spawnX, spawnY;
NormalParticle[] pieces = new NormalParticle[100];

void setup(){
  size(500,500);
  background(0);
  //clrScheme=(int)(Math.random()*3)+1;
  clrScheme=3;
  for(int i = 0; i<pieces.length; i++){
    //spawnX=(int)(Math.random()*51)+50;
    //spawnY=(int)(Math.random()*51)+50;
    pieces[i]=new NormalParticle(0, 0);
  }
}
void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i = 0; i<pieces.length; i++){
    pieces[i].show();
    pieces[i].move();
  }
  println(frameRate);
}
class NormalParticle{
  float x, y, speed, angle;
  int fixedclr, clr2, clr3;
  
  NormalParticle(float xpos, float ypos){
    x=xpos;
    y=ypos;
    speed=random(15);
    angle=random(2*PI);
    fixedclr=100;
    clr2=(int)(Math.random()*255)+1;
    clr3=(int)(Math.random()*255)+1;
  }
  
  void move(){
    x+=(cos(angle)*speed);
    y+=(sin(angle)*speed);
    angle+=0.05;
    speed=random(15);
  }
  
  void show(){
    noStroke();
    if(clrScheme==1)
        fill(fixedclr,clr2,clr3);
    else if(clrScheme==2)
        fill(clr2,fixedclr,clr3);
    else
        fill(clr2,clr3,fixedclr);    
    ellipse(x,y,10,10);
    
  }
  
}
interface Particle{
  public void show();
  public void move();
}
class OddballParticle 
{

}
class JumboParticle 
{


}
