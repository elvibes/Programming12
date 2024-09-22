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
  circle(width/2, height, 100);
  textSize(35);
  fill(0);
  text("EXIT", 400, 577);
  
  //draw scoreboard
  fill(255);
  circle(width/2, 0, 100);
  fill(255, 149, 149);
  text(leftscore, width/2 - 20, 25);
  fill(158, 149, 255);
  text(rightscore, width/2 + 20, 25);
  fill(0);
  text("-", width/2, 25);
  text(timer, 600, 20);
  
  if (dist(ballx, bally, red1x, red1y) <= balld/2 + playerd/2){
    timer++;
  }
  
  if (timer == 1){
    vx = vx - 0.15;
  }
  
  if (vx <= 0){
    vx = 0;
    vy = 0;
  }
  
  //scoring
  if (ballx < -balld/2 && bally > 200 && bally < 400) {
    rightscore++;
    reset();
  }
  
  if (ballx > width + balld/2 && bally > 200 && bally < 400) {
    leftscore++;
    reset();
  }
  
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
  
  //players bumping into each other
  //if(dist(red1x, red1y, red2x, red2y) <= playerd) {
  // red1x = red1x + 5;
  // red1y = red1y + 5;
  //}
  
  //draw ball
  fill(0);
  circle(ballx, bally, balld);
  
  //move ball
  ballx = ballx + vx;
  bally = bally + vy;
  
  playerhitball(red1x, red1y);
  playerhitball(red2x, red2y);
  playerhitball(blue1x, blue1y);
  playerhitball(blue2x, blue2y);
  
  //restricting ball
  if (bally <= balld/2 || bally >= height - balld/2) {
    vy = vy * -1;
  }
  
  if (bally <= 200 && ballx <= balld/2) {
    vx = vx * -1;
  }
  
  if (bally >= 400 && ballx <= balld/2) {
    vx = vx * -1;
  }
  
  if (bally <= 200 && ballx >= width - balld/2) {
    vx = vx * -1;
  }
  
  if (bally >= 400 && ballx >= width - balld/2) {
    vx = vx * -1;
  }
}

void playerhitball (float x, float y) {
  if (dist(ballx, bally, x, y) <= balld/2 + playerd/2) {
    vx = 5;
    vy = 5;
    vx = (ballx - x)/5;
    vy = (bally - y)/5;
  }
}

void reset() {
  red1x = 300;
  red1y = height/2;
  red2x = 55;
  red2y = height/2;
  blue1x = 500;
  blue1y = height/2;
  blue2x = 745;
  blue2y = height/2;
  
  ballx = width/2;
  bally = height/2;
  balld = 40;
  vx = 0;
  vy = 0;
  
  timer = 0;
}

void gameClicks() {
  if(dist(mouseX, mouseY, 400, 600) < 50) {
    mode = INTRO;
  }
  reset();
  leftscore = 0;
  rightscore = 0;
}
