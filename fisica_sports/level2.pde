void level2() {
  makeLine();
  
  if (ball.getY() < 300) ekey = false;
}

void level2Clicks() {
  mode = LEVEL3;
}

void level2setup() {
  makeLand();
  make2Land();
  makeFlag();
  ball.setPosition(100, 340);
  direction.x = ball.getX();
  direction.y = ball.getY();
}

void make2Land() {
  FBlob myBlob = new FBlob();
  FBlob Blob2 = new FBlob();
  FBlob Blob3 = new FBlob();
  FBlob Blob4 = new FBlob();
  FBlob Blob5 = new FBlob();
  FBlob Blob6 = new FBlob();
  FBox platform = new FBox(200, 100);
  myBlob.setAsCircle(260, 320, 100);
  Blob2.setAsCircle(360, 320, 150);
  Blob3.setAsCircle(470, 320, 100);
  Blob4.setAsCircle(570, 320, 158);
  Blob5.setAsCircle(655, 320, 120);
  Blob6.setAsCircle(755, 320, 100);
  
  platform.setPosition(100, 400);

  myBlob.setFillColor(#3BFF49);
  Blob2.setFillColor(#3BFF49);
  Blob3.setFillColor(#3BFF49);
  Blob4.setFillColor(#3BFF49);
  Blob5.setFillColor(#3BFF49);
  Blob6.setFillColor(#3BFF49);
  
  platform.setStatic(true);
  platform.setFillColor(#3BFF49);
  platform.setStrokeWeight(0);
  platform.setFriction(0.1);

  world.add(myBlob);
  world.add(Blob2);
  world.add(Blob3);
  world.add(Blob4);
  world.add(Blob5);
  world.add(Blob6);
  world.add(platform);
}
