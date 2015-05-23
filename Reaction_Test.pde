float circleX = 295;
float circleY = 395;
float diam = 50; //diameter of target
float a = 0; //to use for pythagaron theorem 
float b = 0; //to use for pythagaron theorem 
float c = 0; //to use for pythagaron theorem 
int hits = 0; //total number of hits
int miss = 0; //number of targets missed
int circlesCounted = 0; //how many targets have shown
int totalCounter = 25; //total number of targets to show
float hitPercent = 0; //how many of the total you hit
float missPercent = 0; // how many of the total you missed
int red = 360; //red value for the target
int green = 360; //green value for the target
int blue = 360; //blue value for the target

void setup()
{
  //
  //size of the canvas
  //
  size(700, 500);
}

void draw()
{
  //
  //set the framerate to 60
  //
  frameRate = 60;

  //
  //make the background black
  //
  background(0);

  //
  //set the color of the lines to green
  //
  stroke(0, 360, 0); 

  //
  //width of the lines
  //
  strokeWeight(1);

  //
  //top left
  //
  line(340, 240, 340, 220);
  line(340, 240, 320, 240);
  //
  //top right
  //
  line(360, 240, 360, 220);
  line(360, 240, 380, 240);

  //
  // bottom left
  //
  line(340, 260, 340, 280);
  line(340, 260, 320, 260);

  //
  //bottom right
  //
  line(360, 260, 360, 280);
  line(360, 260, 380, 260);

  //
  //no stroke (outline) on the circles
  //
  noStroke();

  //
  //the changing colour of the target with its values
  //
  fill(red, green, blue);

  //
  //the circle that is the target
  //
  ellipse(circleX, circleY, diam, diam);

  //
  //the up and down arrows for the total targets shown
  //
  fill(0, 360, 0);
  triangle(490, 62, 465, 62, 477, 50);
  triangle(490, 95, 465, 95, 477, 107);

  //
  //if the mouse is in the "ready" spot for 1 second the make a circle
  //
  if (mouseX > 320 && mouseX < 380 && mouseY > 220 && mouseY < 280 && frameCount % 60 == 0)
  {
    newCircle();
  } else
  {

    //
    //this is so the target only stays on the screen for 1 second
    //only run the circle reset once the game is started (for the target display)
    //
    if (frameCount % 60 == 0 && circleX != -100 && circleY != -100 && circlesCounted > 0)
    {
      //
      //rest the coordinates for off the screen and add a miss
      //
      circleX = -100;
      circleY = -100;
      println("moved");
      miss = miss + 1;
    }
  }

  //
  //only run this when the game hasnt started
  //
  if (circlesCounted == 0)
  {
    textSize(16);
    fill(0, 360, 0);
    text("Place cursor in the middle to ready up.", 200, 300);
    text("Click on the target when it shows ", 215, 325);
    text("then, return to the middle and continue.", 195, 350);
    text("Choose Target Colour: ", 50, 450);
    text("Current Target Looks Like: ", 50, 400);
    fill(360, 0, 0);
    ellipse(435, 445, 40, 40);
    fill(0, 0, 360);
    ellipse(255, 445, 40, 40);
    fill(360, 0, 360);
    ellipse(300, 445, 40, 40);
    fill(0, 360, 0);
    ellipse(345, 445, 40, 40);
    fill(255);
    ellipse(390, 445, 40, 40);
  }

  //
  //this was used to display the mouse coordinates
  //
  textSize(12);
  text("mouseX is: " +mouseX, mouseX, mouseY+10);
  text("mouseY is: " +mouseY, mouseX, mouseY);

  //
  //display text with your hits and misses and targets shown out of the total
  //
  textSize(32);
  fill(0, 360, 0);
  text("Hits: " + hits, 285, 30);
  text("Misses: " + miss, 285, 60);
  text("Shown: " + circlesCounted, 285, 90);
  text("/" + totalCounter, 440, 90);
  textSize(12);
  text("FPS: " +frameRate, 25, 25);

  //
  //calculate your hit and miss percentage
  //
  hitPercent = (float) hits / (float) totalCounter * 100;
  missPercent = (float) miss / (float) totalCounter * 100;

  //
  //when all the targets have shown then display your hit and miss percentage
  //
  if (circlesCounted == totalCounter)
  {
    text("hitPercent is: " + nf(hitPercent, 2, 1), 25, 75);
    text("missPercent is: " + nf(missPercent, 2, 1), 25, 100);
  }

  //
  //reset the game when you display one more target after your final score has been shown
  //
  if (circlesCounted > totalCounter ||  key == 'R')
  {
    circlesCounted = 0;
    hits = 0;
    miss = 0;
  }

  //
  //cannot have any misses before the game starts
  //
  if (circlesCounted == 0)
  {
    miss = 0;
  }
}

//
//this runs when the mouse button is released
//
void mouseReleased()
{
  a = mouseX - circleX; //horizontal leg of the triangle
  b = mouseY - circleY; //vert leg of tirangle
  c = sqrt(a*a + b*b); //use pythagorean theorem to the the hypotenuse

  //
  //check the click to see if it is in the circle
  //
  if (c < diam/2) 
  {
    //println("hit");
    circleX = -100;              
    circleY = -100;
    hits = hits + 1;
  } 

  //
  //this can only run when the game has not started
  //
  if (circlesCounted == 0)
  {

    //
    //this checks if you click on the up total counter button
    //
    if (mouseX > 465 && mouseX < 490 && mouseY < 62 && mouseY > 50)
    {
      totalCounter = totalCounter + 25;
    }

    //
    //this checks if you pressed the down total counter button
    //
    if (mouseX > 465 && mouseX < 490 && mouseY < 107 && mouseY > 95)
    {
      totalCounter = totalCounter - 25;
    }

    //
    //check if you pressed in the purple circle to change the colour
    //
    if (mouseX > 280 && mouseX < 320 && mouseY > 425 && mouseY < 465)
    {
      red = 360;
      green = 0;
      blue = 360;
    }

    //
    //check if you pressed in the green circle to change colour
    //
    if (mouseX > 325 && mouseX < 365 && mouseY > 425 && mouseY < 465)
    {
      red = 0;
      green = 360;
      blue = 0;
    }

    //
    //check if you pressed in the white circle to change colour
    //
    if (mouseX > 370 && mouseX < 410 && mouseY > 425 && mouseY < 465)
    {
      red = 360;
      green = 360;
      blue = 360;
    }

    //
    //check if you pressed in the red circle
    //
    if (mouseX > 415 && mouseX < 455 && mouseY > 425 && mouseY < 465)
    {
      red = 360;
      green = 0;
      blue = 0;
    }

    //
    //check if you pressed in the blue circle
    //
    if (mouseX > 235 && mouseX < 275 && mouseY > 425 && mouseY < 465)
    {
      red = 0;
      green = 0;
      blue = 360;
    }
  }  

  //
  //you cannot have less than 25 targets show
  //
  if (totalCounter < 25)
  {
    totalCounter = 25;
  }
}

//
//this sets the random points for the target and adds to the number of targets shown
//
void newCircle()
{
  circleX = floor(random(50, 650));
  circleY = floor(random(100, 450));
  circlesCounted = circlesCounted + 1;
}
