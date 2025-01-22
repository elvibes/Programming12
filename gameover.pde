void gameover() {
  if (win == true) {
    background(winimg);
  } else {
    background(lose);
  }
}

void gameoverClicks() {
  mode = INTRO;
  game1reset();
}
