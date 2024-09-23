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
  red1x = red1x + vxred1;
  red1y = red1y + vyred1;
  blue1x = blue1x + vxblue1;
  blue1y = blue1y + vyblue1;
  red2x = red2x + vxred2;
  red2y = red2y + vyred2;
  blue2x = blue2x + vxblue2;
  blue2y = blue2y + vyblue2;
  vxred1 = vxred1 * 0.05;
  vyred1 = vyred1 * 0.05;
  vxblue1 = vxblue1 * 0.05;
  vyblue1 = vyblue1 * 0.05;
  vxred2 = vxred2 * 0.05;
  vyred2 = vyred2 * 0.05;
  vxblue2 = vxblue2 * 0.05;
  vyblue2 = vyblue2 * 0.05;

  if (dist(red1x, red1y, blue1x, blue1y) <= playerd) {
    vxred1 = (red1x - blue1x)/8;
    vyred1 = (red1y - blue1y)/8;
    vxblue1 = vxred1 * -1;
    vyblue1 = vyred1 * -1;
  }

  if (dist(red1x, red1y, red2x, red2y) <= playerd) {
    vxred1 = (red1x - red2x)/8;
    vyred1 = (red1y - red2y)/8;
    vxred2 = vxred1 * -1;
    vyred2 = vyred1 * -1;
  }

  if (dist(red1x, red1y, blue2x, blue2y) <= playerd) {
    vxred1 = (red1x - blue2x)/8;
    vyred1 = (red1y - blue2y)/8;
    vxblue2 = vxred1 * -1;
    vyblue2 = vyred1 * -1;
  }
  
  if (dist(blue1x, blue1y, blue2x, blue2y) <= playerd) {
    vxblue1 = (blue1x - blue2x)/8;
    vyblue1 = (blue1y - blue2y)/8;
    vxblue2 = vxblue1 * -1;
    vyblue2 = vyblue1 * -1;
  }
  
  if (dist(blue1x, blue1y, red2x, red2y) <= playerd) {
    vxblue1 = (blue1x - red2x)/8;
    vyblue1 = (blue1y - red2y)/8;
    vxred2 = vxblue1 * -1;
    vyred2 = vyblue1 * -1;
  }

  //draw ball
  fill(0);
  circle(ballx, bally, balld);

  //move ball
  ballx = ballx + vx;
  bally = bally + vy;
  vx = vx * 0.98;
  vy = vy * 0.98;

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
}

void gameClicks() {
  if (dist(mouseX, mouseY, 400, 600) < 50) {
    mode = INTRO;
    reset();
    leftscore = 0;
    rightscore = 0;
  }
}
