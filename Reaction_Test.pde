float circleX = -100;
float circleY = -100;
float diam = 0;                                          //diameter
float a = 0;                                             //to use for pythagaron theorem 
float b = 0;                                             //to use for pythagaron theorem 
float c = 0;                                             //to use for pythagaron theorem 
int hits = 0;
int miss = 0;
int circlesCounted = 0;
int totalCounter = 25;
boolean counterFull = false;
float hitPercent = 0;
float missPercent = 0;

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

  fill(0, 360, 0);
  triangle(490, 62, 465, 62, 477, 50);
  triangle(490, 95, 465, 95, 477, 107);


  if (mouseX > 320 && mouseX < 380 && mouseY > 220 && mouseY < 280 && frameCount % 60 == 0)
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

  if (circlesCounted == 0)
  {
    textSize(16);
    fill(0, 360, 0);
    text("Place cursor in the middle to ready up", 200, 300);
    text("return to the middle to continue.", 215, 325);
  }
  textSize(12);
  text("mouseX is: " +mouseX, mouseX, mouseY+10);
  text("mouseY is: " +mouseY, mouseX, mouseY);

  // println("counter: " + counter);
  textSize(32);
  fill(0, 360, 0);
  text("Hits: " + hits, 285, 30);
  text("Misses: " + miss, 285, 60);
  text("Shown: " + circlesCounted, 285, 90);
  text("/" + totalCounter, 440, 90);
  textSize(12);
  text("FPS: " +frameRate, 25, 25);
  hitPercent = (float) hits / (float) totalCounter * 100;
  missPercent = (float) miss / (float) totalCounter * 100;


  if (circlesCounted == totalCounter)
  {
    text("hitPercent is: " + nf(hitPercent, 2, 1), 25, 75);
    text("missPercent is: " + nf(missPercent, 2, 1), 25, 100);
  }

  if (circlesCounted > totalCounter)
  {
    counterFull = true; 
    circlesCounted = 0;
    hits = 0;
    miss = 0;
  }
  
  if(hits == 0 && circlesCounted == 0)
  {
   miss = 0; 
  }
}

void mouseReleased()
{
  a = mouseX - circleX; //horizontal leg of the triangle
  b = mouseY - circleY; //vert leg of tirangle
  c = sqrt(a*a + b*b); //use pythagorean theorem to the the hypotenuse

  //check the click to see if it is in the circle
  if (c < diam/2) 
  {
    //println("hit");
    circleX = -100;              
    circleY = -100;
    hits = hits + 1;
  } else
  {
    //println("miss");
    miss = miss + 1;
  }
  
  if (mouseX > 465 && mouseX < 490 && mouseY < 62 && mouseY > 50)
  {
    totalCounter = totalCounter + 25;
  }
  if (mouseX > 465 && mouseX < 490 && mouseY < 107 && mouseY > 95)
  {
    totalCounter = totalCounter - 25;
  }
  if (totalCounter < 25)
  {
    totalCounter = 25;
  }
}
void newCircle()
{
  diam = 50;
  circleX = floor(random(50, 650));
  circleY = floor(random(100, 450));
  circlesCounted = circlesCounted + 1;
}
