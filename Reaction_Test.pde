float circleX = -100;
float circleY = -100;
float diam = 0;                                          //diameter
float a = 0;                                             //to use for pythagaron theorem 
float b = 0;                                             //to use for pythagaron theorem 
float c = 0;                                             //to use for pythagaron theorem 
int hits = 0;
int miss = 0;
int counted = 0;
int counter = 0;
boolean counterFull = false;

void setup()
{
  size(700, 500);
}

void draw()
{
  
  frameRate = 60;
  background(0);
  stroke(0, 360, 0); //set the color of the lines to green
  strokeWeight(1);
  //top left
  line(340, 240, 340, 220);
  line(340, 240, 320, 240);
  //top right
  line(360, 240, 360, 220);
  line(360, 240, 380, 240);
  // bottom left
  line(340, 260, 340, 280);
  line(340, 260, 320, 260);
  //bottom right
  line(360, 260, 360, 280);
  line(360, 260, 380, 260);
  noStroke();
  fill(255);
  ellipse(circleX, circleY, diam, diam);
  
  counter = 10;
  

  if (mouseX > 320 && mouseX < 380 && mouseY > 220 && mouseY < 280 && frameCount % 60 == 0 )
  {
    newCircle();
  } else
  {
    if (frameCount % 60 == 0)
    {
      circleX = -100;
      circleY = -100;
      println("moved");
    
    }
  }
  // text("mouseX is: " +mouseX, mouseX, mouseY+10);
  // text("mouseY is: " +mouseY, mouseX, mouseY);

  // println("counter: " +counter);
  textSize(32);
  fill(0, 360, 0);
  text("Hits: " + hits, 285, 30);
  text("Misses: " + miss, 285, 60);
  textSize(12);
  text("FPS: " +frameRate, 25, 25);
  
  if (counted >= counter)
  {
   counterFull = true; 
   println("counted = " + counted);
  }
}

void mouseReleased()
{
  a = mouseX - circleX;   //horizontal leg of the triangle
  b = mouseY - circleY;   //vert leg of tirangle
  c = sqrt(a*a + b*b);    //use pythagorean theorem to the the hypotenuse


  //check the click to see if it is in the circle
  if (c < diam/2) 
  {
    println("hit");
    circleX = -100;              
    circleY = -100;
    hits = hits + 1;
  } else
  {
    println("miss");
    miss = miss + 1;
  }
}
void newCircle()
{
  
  diam = 50;
  circleX = floor(random(50, 650));
  circleY = floor(random(50, 450));
  counted = counted + 1;
}
