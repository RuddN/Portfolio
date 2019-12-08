int diesize = 50;
int jPlus1ORiPlus1=0;
int equation4sizeXorY = jPlus1ORiPlus1*(diesize+10)+30;
Die[][] dice = new Die[5][5];
int totalvalue;
int totalRoll, numRoll, numRollLeft, cRollVal, cRollNum; 
int wins, losses;
double avgRoll;
PImage party, youwin, youlose, sadface;

void setup()
{
  noLoop();
  size(330, 500);
  background(51, 56, 84);
  totalvalue=0;
  totalRoll=0;
  numRoll=1;
  numRollLeft=24;
  cRollVal=0;
  cRollNum=1;
  wins=0;
  losses=0;
  party = loadImage("celebratesmol.png");
  youwin = loadImage("youwin.png");
  youlose = loadImage("you lose stamp.png");
  sadface = loadImage("sad-face.png");
  for(int i=0; i<dice.length; i++){
    for(int j=0; j<dice.length; j++){
      dice[i][j] = new Die((j*(diesize+10)+20), (i*(diesize+10))+80, diesize);
    }
  }
}
void draw()
{
 noStroke();
 fill(51, 56, 84);
 rect(0, 0, 330, 500);
 for(int i=0; i<dice.length; i++){
    for(int j=0; j<dice.length; j++){
      dice[i][j].show();
      System.out.println("Die at coordinates: (" + j + ", " + i + ") has a value of " + dice[i][j].getValue());
      totalvalue+=dice[i][j].getValue();
      totalRoll+=dice[i][j].getValue();
     }
  }
  if(Math.abs(100-cRollVal)>=Math.abs(100-totalvalue)){
    cRollVal=totalvalue;
    cRollNum=numRoll;
  }
  avgRoll = (double)totalRoll/(double)numRoll;
  avgRoll=(double)Math.round((avgRoll*100.0))/100.0;
  noStroke();
  fill(51, 56, 84);
  rect(0, 370, 330, 180);
  rect(0, 0, 330, 80);
  textSize(25);
  fill(255,255,255);
  text("Roll a total of 100 before", 15, 25);
  text("you run out of rolls!", 40, 50);
  textSize(18);
  text("Wins: " + wins + "  Losses: " + losses, 85, 72);
  textSize(25);
  text("Total: " + totalvalue, 105, 400);
  textSize(18);
  text("Number of Rolls Left: " + numRollLeft, 25, 430);
  text("Average Total: " + avgRoll, 25, 455);
  text("Closest Roll: #" + cRollNum + " with value " + cRollVal, 25, 480);
  if (numRollLeft==0){
    fill(227, 227, 227);
    rect(0, 0, 330, 500);
    image(youlose, 15, 30);
    image(sadface, 55, 190);
    fill(212,17,17);
    textSize(24);
    text("Click to play again. :)", 45, 470);
    losses+=1;
  }
  if(totalvalue==100){
    fill(51, 56, 84);
    rect(0, 0, 330, 500);
    image(party, 15, 30);
    noFill();
    strokeWeight(13);
    stroke(163, 237, 255);
    rect(15, 320, 300, 105, 30);
    image(youwin, 15, 320);
    textSize(18);
    fill(163, 237, 255);
    text("Click to play again. :)", 75, 470);
    wins+=1;
  }
}
void mousePressed()
{
  if(totalvalue==100){
    totalRoll=0;
    numRoll=0;
    numRollLeft=25;
    cRollVal=0;
    cRollNum=0;
  }
  if(numRollLeft==0){
    totalRoll=0;
    numRoll=0;
    numRollLeft=25;
    cRollVal=0;
    cRollNum=0;
  }
  for(int i=0; i<dice.length; i++){
    for(int j=0; j<dice.length; j++){
      dice[i][j].roll();
      System.out.println("Die at coordinates: (" + j + ", " + i + ") has a value of " + dice[i][j].getValue());
    }
  }
  numRoll+=1;
  numRollLeft-=1;
  totalvalue=0;
  redraw();
}

class Die //models one single dice cube
{
  int xval, yval;
  int value;
  int size;
  int topx, midx, botx, topy, midy, boty;
  
  Die(int x, int y, int s) //constructor
  {
    xval = x;
    yval = y;
    size=s;
    value = (int)(Math.random()*6)+1;
    topx = xval+11;
    midx = xval+(size/2);
    botx = xval+(size-11);
    topy = yval+11;
    midy = yval+(size/2);
    boty = yval+(size-11);
  }
  void roll()
  {
    value = (int)(Math.random()*6)+1;
  }
  
  
  void show()
  {
   noStroke();
   if(value==1){
     fill(197, 237, 225);
     rect(xval, yval, size, size, 7);
     one();
   } else if(value==2){
     fill(192, 253, 188);
     rect(xval, yval, size, size, 7);
     two();
   } else if(value==3){
     fill(211, 192, 249);
     rect(xval, yval, size, size, 7);
     three();
   } else if(value==4){
     fill(249, 154, 156);
     rect(xval, yval, size, size, 7);
     four();
   } else if(value==5){
     fill(253, 188, 207);
     rect(xval, yval, size, size, 7);
     five();
   } else if(value==6){
     fill(253, 237, 188);
     rect(xval, yval, size, size, 7);
     six();
   }
  }
  
  void show(int x, int y)
  {
    xval=x;
    yval=y;
    show();
  }
  
  void one(){
    fill(0,0,0);
    ellipse(midx, midy, 7, 7);
  }
  
  void two(){
    fill(0,0,0);
    ellipse(topx, topy, 7, 7);
    ellipse(botx, boty, 7, 7);
  }
  
  void three(){
    fill(0,0,0);
    one();
    two();
  }
  
  void four(){
    fill(0,0,0);
    two();
    ellipse(botx, topy, 7, 7);
    ellipse(topx, boty, 7, 7);
  }
  
  void five(){
    fill(0,0,0);
    one();
    four();
  }
  
  void six(){
    fill(0,0,0);
    four();
    ellipse(topx, midy, 7, 7);
    ellipse(botx, midy, 7, 7);
  }
  
  int getValue(){
    return value;
  }
}
