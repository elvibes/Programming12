FPoly p1, p2, p3;

void level3() {
  makeLine();
}

void level3Clicks() {
  mode = GAMEOVER;
  
  p1.removeFromWorld();
  p2.removeFromWorld();
  p3.removeFromWorld();
  p1.setDrawable(false);
  p2.setDrawable(false);
  p3.setDrawable(false);
  Aland.removeFromWorld();
  Bland.removeFromWorld();
}

void level3setup() {
  make3Land();
  ball.setPosition(10, 85);
  direction.x = ball.getX();
  direction.y = ball.getY();
  hole.setPosition(660, height/2 + 150);
  make1Land();
  Aland.setPosition(220, 550);
  Bland.setPosition(775, 550);
}

void make3Land() {
  p1 = new FPoly();
  p2 = new FPoly();
  p3 = new FPoly();
  
  p1.vertex(0, 100);
  p1.vertex(370, 50);
  p1.vertex(370, 100);
  p1.vertex(0, 150);
  
  p2.vertex(width, 200);
  p2.vertex(430, 150);
  p2.vertex(430, 200);
  p2.vertex(width, 250);
  
  p3.vertex(70, 200);
  p3.vertex(95, 200);
  p3.vertex(250, 350);
  p3.vertex(400, 350);
  p3.vertex(525, 220);
  p3.vertex(550, 225);
  p3.vertex(400, 375);
  p3.vertex(250, 375);
  
  p1.setStatic(true);
  p1.setFillColor(#3BFF49);
  p1.setStrokeWeight(0);
  p1.setFriction(0.1);
  
  p2.setStatic(true);
  p2.setFillColor(#3BFF49);
  p2.setStrokeWeight(0);
  p2.setFriction(0.1);
  
  p3.setStatic(true);
  p3.setFillColor(#3BFF49);
  p3.setStrokeWeight(0);
  p3.setFriction(0.1);
  
  world.add(p1);
  world.add(p2);
  world.add(p3);
}
