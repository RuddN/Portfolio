var startX=random(800);
var startY=0;
var endX=random(800);
var endY=0;
var grass, hamster;

var rain=new Raindrop[15];

var flashes=new Flash[10];
var hammy=new Hamster();

function setup()
{
  createCanvas(800, 500);
  strokeWeight(4);
  background(51, 56, 84);
  for(var i=0; i<rain.length; i++){
     rain[i]=new Raindrop();
  }
  for(var i=0; i<flashes.length; i++){
    flashes[i]=new Flash();
  }
  grass=loadImage("GrassSmol.png");
}

function draw()
{
  for(var i=0; i<flashes.length; i++){
    flashes[i].show();
    flashes[i].reset();
  }
  for (var i=0; i<rain.length; i++){
    rain[i].show();
    rain[i].move();
  }
  image(grass, 0, 384);
  image(grass, 500, 384);
  hammy.show();
  hammy.move();
}

class Flash {

  function show() {
    stroke(255, 255, 204);
    while (endX<800) {
      endX=startX+(random(80)-20);
      endY=startY+random(200);
      line(startX, startY, endX, endY);
      startX=endX;
      startY=endY;
    }

  }

  function reset() {
    startX=random(800);
    startY=0;
    endX=random(800);
    endY=0;
    setup();
    show();
  }
}

class Hamster{
  var xval = 0;
  var yval = 310;
  var speed = 15;
   
   function show(){
     hamster=loadImage("hamstervsmolwbrella.png");
     image(hamster, xval, yval);
   }
   
   function move(){
     xval+=speed;
     if (xval<0 || xval>654){
       speed*=-1;
     }
   }
   
   function getX(){
      return xval; 
   }
   
   function getY(){
      return yval; 
   }
   
}

class Raindrop{
  
  var x, y;
  var yspeed;
  var size;
  
  function Raindrop(){
    x=random(800);
    y=random(800);
    yspeed=1;
    size=1;
  }
  
  function show() {
    fill(165, 207, 255);
    stroke(165,207,255);
    //ellipse(x, y, size, size);
    line(x, y, x, y+10);
  }
  
  function move() {
    y+=yspeed;
    if (y>500){
      y=-20;
      x=random(800);
    }
  }
}
