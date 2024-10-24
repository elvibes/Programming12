void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ENTER) ekey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ENTER) ekey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
    level1setup();
  } else if (mode == LEVEL1) {
    level1Clicks();
    level2setup();
  } else if (mode == LEVEL2) {
    level2Clicks();
    level3setup();
  } else if (mode == LEVEL3) {
    level3Clicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
