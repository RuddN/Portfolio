var startX;
var startY;
var endX;
var endY;
var grass, hamster;

var rain;
var flashes;
var hammy;

function setup()
{
  createCanvas(800, 500);
  strokeWeight(4);
  background(51, 56, 84);
  startX=random(800);
  startY=0;
  endX=random(800);
  endY=0;
  hammy=new Hamster();
  rain=[];
  flashes=[];
  for(let i=0; i<16; i++){
     rain[i]=new Raindrop();
  }
  for(let i=0; i<11; i++){
    flashes[i]=new Flash();
  }
  grass=new Image();
  grass.src = 'GrassSmol.png';
}

function draw()
{
  for(let i=0; i<16; i++){
    flashes[i].show();
    flashes[i].reset();
  }
  for (let i=0; i<11; i++){
    rain[i].show();
    rain[i].move();
  }
  image(grass, 0, 384);
  image(grass, 500, 384);
  hammy.show();
  hammy.move();
}

class Flash {
  
  constructor(){
  }
  
  show() {
    stroke(255, 255, 204);
    while (endX<800) {
      endX=startX+(random(80)-20);
      endY=startY+random(200);
      line(startX, startY, endX, endY);
      startX=endX;
      startY=endY;
    }

  }

  reset() {
    startX=random(800);
    startY=0;
    endX=random(800);
    endY=0;
    setup();
    show();
  }
}

class Hamster{
  constructor(){
    this.xval = 0;
    this.yval = 310;
    this.speed = 15;
  }
   
   show(){
     hamster = new Image();
     hamster.src = "hamstervsmolwbrella.png";
     image(hamster, this.xval, this.yval);
   }
   
   move(){
     this.xval+=this.speed;
     if (this.xval<0 || this.xval>654){
       this.speed*=-1;
     }
   }
   
   getX(){
      return this.xval; 
   }
   
   getY(){
      return this.yval; 
   }
   
}

class Raindrop{

  constructor(){
    this.x=random(800);
    this.y=random(800);
    this.yspeed=1;
    this.size=1;
  }
  
  show() {
    fill(165, 207, 255);
    stroke(165,207,255);
    //ellipse(x, y, size, size);
    line(this.x, this.y, this.x, this.y+10);
  }
  
  move() {
    this.y+=this.yspeed;
    if (this.y>500){
      this.y=-20;
      this.x=random(800);
    }
  }
}
