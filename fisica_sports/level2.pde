FBlob myBlob;
FBlob Blob2;
FBlob Blob3;
FBlob Blob4;
FBlob Blob5;
FBlob Blob6;
FBox platform;

void level2() {
  makeLine();
  
  fill(#3BFF49);
  stroke(#3BFF49);
  rect(600, 460, width, 100);
  
  if (ball.getVelocityX() > 0.5 || ball.getVelocityY() > 0.5) {
    ekey = false;
  }

  if (hitHole(ball) && frameCount % 300 == 0) {
    mode = LEVEL3;
    myBlob.removeFromWorld();
    Blob2.removeFromWorld();
    Blob3.removeFromWorld();
    Blob4.removeFromWorld();
    Blob5.removeFromWorld();
    Blob6.removeFromWorld();
    platform.removeFromWorld();
    myBlob.setDrawable(false);
    Blob2.setDrawable(false);
    Blob3.setDrawable(false);
    Blob4.setDrawable(false);
    Blob5.setDrawable(false);
    Blob6.setDrawable(false);
    platform.setDrawable(false);
    level3setup();
  }
  
  fill(0);
  textSize(30);
  text(score, 750, 50);
}

void level2setup() {
  make2Land();
  ball.setPosition(100, 340);
  direction.x = ball.getX();
  direction.y = ball.getY();
  hole.setPosition(660, height/2 + 45);
}

void make2Land() {
  myBlob = new FBlob();
  Blob2 = new FBlob();
  Blob3 = new FBlob();
  Blob4 = new FBlob();
  Blob5 = new FBlob();
  Blob6 = new FBlob();
  platform = new FBox(200, 100);
  myBlob.setAsCircle(260, 320, 100);
  Blob2.setAsCircle(360, 320, 150);
  Blob3.setAsCircle(470, 320, 100);
  Blob4.setAsCircle(570, 320, 158);
  Blob5.setAsCircle(655, 350, 120);
  Blob6.setAsCircle(755, 320, 100);

  platform.setPosition(100, 400);

  myBlob.setFillColor(#3BFF49);
  myBlob.setStrokeColor(#3BFF49);
  Blob2.setFillColor(#3BFF49);
  Blob2.setStrokeColor(#3BFF49);
  Blob3.setFillColor(#3BFF49);
  Blob3.setStrokeColor(#3BFF49);
  Blob4.setFillColor(#3BFF49);
  Blob4.setStrokeColor(#3BFF49);
  Blob5.setFillColor(#3BFF49);
  Blob5.setStrokeColor(#3BFF49);
  Blob6.setFillColor(#3BFF49);
  Blob6.setStrokeColor(#3BFF49);

  platform.setStatic(true);
  platform.setFillColor(#3BFF49);
  platform.setStrokeColor(#3BFF49);
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
