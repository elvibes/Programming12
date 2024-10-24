void level1() {
  makeLine();
  
  if (ball.getY() < 372) ekey = false;
}

void level1Clicks() {
  mode = LEVEL2;
  Aland.removeFromWorld();
  Bland.removeFromWorld();
  Aland.setDrawable(false);
  Bland.setDrawable(false);
}

void level1setup() {
  makeLand();
  make1Land();
  makeFlag();
  makeBall();
}
