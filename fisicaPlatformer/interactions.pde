void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == ' ') spacekey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (key == ' ') spacekey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == LEVEL1) {
    level1Clicks();
  } else if (mode == LEVEL2) {
    level2Clicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
