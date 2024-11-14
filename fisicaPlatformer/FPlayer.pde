class FPlayer extends FGameObject {
  FPlayer() {
    super();
    setPosition(0, 0);
    setName("player");
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    handleInput();
    if (isTouching("spike")) {
      setPosition(0, 0);
    }
  }
  
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity(-200, vy);
    if (dkey) setVelocity(200, vy);
    if (wkey) setVelocity(vx, -200);
    if (skey) setVelocity(vx, 200);
  }
}
