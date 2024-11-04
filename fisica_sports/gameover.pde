void gameover() {
  textSize(100);
  fill(0);
  if (score <= 5) {
    text("You won!", width/2, height/2-50);
  }

  if (score > 5) {
    text("You lost!", width/2, height/2);
  }

  myButtons[1].show();
  if (myButtons[1].clicked) {
    mode = INTRO;
  }
}

//void gameoverClicks() {
//  mode = INTRO;
//}
