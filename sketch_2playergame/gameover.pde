void gameover() {
  if (leftscore == 5) {
    fill(255, 149, 149, 20);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(100);
    text("PLAYER 1 WINS", width/2, 250);
    textSize(80);
    text("Click to restart", width/2, 350);
  }
  
  if (rightscore == 5) {
    fill(158, 149, 255, 20);
    rect(width/2, height/2, width, height);
    textSize(100);
    fill(255);
    text("PLAYER 2 WINS", width/2, 250);
    
    textSize(80);
    text("Click to restart", width/2, 350);
  }
}

void gameoverClicks() {
  mode = INTRO;
}
