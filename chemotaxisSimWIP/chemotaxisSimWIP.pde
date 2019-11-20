ArrayList<Bacteria> buddies = new ArrayList<Bacteria>(1);
boolean food, water, WBCell, newBuddy;
void setup()   
{     
  size(500, 500);
  background(0,0,0);
  food=false;
  water=false;
  WBCell=false;
  newBuddy=true;
  int count=0;
  for(Bacteria buddy : buddies){
    count++;
    buddy = new Bacteria(count, 250, 250);
  }
}   
void draw()   
{
  println("working");
  for (Bacteria buddy : buddies) {
    buddy.exist();
  }
}  
class Bacteria    
{     
  int x, y;
  int size;
  int clr1, clr2, clr3;
  int tag;

  public Bacteria(int tagName, int xpos, int ypos) {
    x=xpos;
    y=ypos;
    size=20;
    tag=tagName;
    clr1=(int)(Math.random()*245)+1;
    clr2=(int)(Math.random()*245)+1;
    clr3=(int)(Math.random()*245)+1;
  }

  public void exist() {
    fill(clr1, clr2, clr3);
    ellipse(x, y, size, size);
  }

  public void exist(int xpos, int ypos) {
    x=xpos;
    y=ypos;
    exist();
  }
}    
