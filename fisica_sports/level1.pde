void level1() {
  makeLine();
  
  if (ball.getVelocityX() > 0.5) ekey = false;
  if (ball.getVelocityY() > 0.5) ekey = false;
}

void level1Clicks() {
  mode = LEVEL2;
}

void level1setup() {
  makeLand();
  makeAdditionalLand();
  makeFlag();
  makeBall();
}
