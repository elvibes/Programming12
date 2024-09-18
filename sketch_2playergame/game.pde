void game() {
  soccerfield();
  
  //goal
  stroke(255);
  fill(29, 170, 56);
  rect(25, 300, 100, 200);
  
  rect(775, 300, 100, 200);
  
  //center line
  line(400, 0, 400, 600);
  
  //exit button
  fill(255);
  circle(400, 600, 100);
  textSize(35);
  fill(0);
  text("EXIT", 400, 577);
  
  //draw players
  noStroke();
  fill(255, 149, 149);
  circle(red1x, red1y, playerd);
  circle(red2x, red2y, playerd);
  
  fill(158, 149, 255);
  circle(blue1x, blue1y, playerd);
  circle(blue2x, blue2y, playerd);
  
  //move players
  if (wkey == true) red1y = red1y - 5;
  if (skey == true) red1y = red1y + 5;
  if (akey == true) red1x = red1x - 5;
  if (dkey == true) red1x = red1x + 5;
  
  if (wkey == true) red2y = red2y - 5;
  if (skey == true) red2y = red2y + 5;
  if (akey == true) red2x = red2x - 5;
  if (dkey == true) red2x = red2x + 5;
  
  if (upkey == true) blue1y = blue1y - 5;
  if (downkey == true) blue1y = blue1y + 5;
  if (leftkey == true) blue1x = blue1x - 5;
  if (rightkey == true) blue1x = blue1x + 5;
  
  if (upkey == true) blue2y = blue2y - 5;
  if (downkey == true) blue2y = blue2y + 5;
  if (leftkey == true) blue2x = blue2x - 5;
  if (rightkey == true) blue2x = blue2x + 5;
  
  //restricting players
  if (red2x > 75) red2x = 75;
  if (red2x < 30) red2x = 30;
  if (red2y > 400) red2y = 400;
  if (red2y < 200) red2y = 200;
  
  if (blue2x < 725) blue2x = 725;
  if (blue2x > width-30) blue2x = width-30;
  if (blue2y > 400) blue2y = 400;
  if (blue2y < 200) blue2y = 200;
  
  if (red1x > width-30) red1x = width-30;
  if (red1x < 30) red1x = 30;
  if (red1y > height-30) red1y = height-30;
  if (red1y < 30) red1y = 30;
  
  if (blue1x < 30) blue1x = 30;
  if (blue1x > width-30) blue1x = width-30;
  if (blue1y > height-30) blue1y = height-30;
  if (blue1y < 30) blue1y = 30;
}

void gameClicks() {
  if(dist(mouseX, mouseY, 400, 600) < 50) {
    mode = INTRO;
  }
}
