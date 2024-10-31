void level1() {
  makeLine();
  
  if (ekey && ball.getVelocityX() < 0.4 && ball.getVelocityX() > -0.4) {
    score = score + 1;
  }

  if (ball.getY() < 372) ekey = false;

  if (hitHole(ball) && frameCount % 300 == 0) {
    mode = LEVEL2;
    Aland.removeFromWorld();
    Bland.removeFromWorld();
    Aland.setDrawable(false);
    Bland.setDrawable(false);
    level2setup();
  }
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
