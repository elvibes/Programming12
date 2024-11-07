class FPlayer extends FBox{
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(150, 50);
    setFillColor(red);
  }
  
  void act() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity(-200, vy);
    if (dkey) setVelocity(200, vy);
    if (wkey) setVelocity(vx, -200);
    if (skey) setVelocity(vx, 200);
  }
  
}
