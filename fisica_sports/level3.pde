FPoly p1, p2;

void level3() {
  makeLine();
}

void level3Clicks() {
  mode = GAMEOVER;
}

void level3setup() {
  makeLand();
  make3Land();
  makeFlag();
  //ball.setPosition(100, 340);
  //direction.x = ball.getX();
  //direction.y = ball.getY();
}

void make3Land() {
  p1 = new FPoly();
  p2 = new FPoly();
  
  p1.vertex(658, height/2 - 30);
  p1.vertex(690, height/2 - 15);
  p1.vertex(658, height/2);
  p1.vertex(658, height/2 - 30);
  
  p2.vertex(658, height/2 - 30);
  p2.vertex(690, height/2 - 15);
  p2.vertex(658, height/2);
  p2.vertex(658, height/2 - 30);
  
  world.add(p1);
  world.add(p2);
}
