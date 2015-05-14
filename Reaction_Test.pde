float circleX = -100;
float circleY = -100;

void setup()
{
  size(700, 500);
}

void draw()
{
  background(0);
  stroke(0, 360, 0);
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
  ellipse(circleX, circleY, 50, 50);

  if (mouseX > 340 && mouseX < 360 && mouseY > 220 && mouseY < 280 && frameCount % 60 == 0)
  {
    newCircle();
  } 
  else
  {
    if (frameCount % 60 == 0)
    {
      circleX = -100;
      circleY = -100;
    }
  }
}

void mouseClicked()
{

}
void newCircle()
{
  circleX = floor(random(50, 650));

  circleY = floor(random(50, 450));
}
