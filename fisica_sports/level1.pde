void level1() {
  makeLine();

  if (ball.getVelocityX() > 0.5 || ball.getVelocityY() > 0.5) {
    ekey = false;
  }

  if (hitHole(ball) && frameCount % 300 == 0) {
    mode = LEVEL2;
    Aland.removeFromWorld();
    Bland.removeFromWorld();
    Aland.setDrawable(false);
    Bland.setDrawable(false);
    level2setup();
  }

  fill(0);
  textSize(30);
  text(score, 750, 50);
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
