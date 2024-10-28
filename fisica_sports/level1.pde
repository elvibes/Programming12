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
  direction.x = ball.getX();
  direction.y = ball.getY();
  makeHole();
  hole.setPosition(660, height/2 + 150);
  Aland.setPosition(220, 530);
  Bland.setPosition(775, 530);
}
