class FTube extends FGameObject {

  FTube(float x, float y) {
    super();
    setPosition(x, y);
    setName("tube");
    setStatic(true);
    setSensor(false);
    setFriction(10);
  }

  void act() {
    attachImage(tube);
    collide();
  }

  void collide() {
    if (isTouching("player")) {
      if (mode == LEVEL1 && player.getY() < getY() - gridSize/2) {
        level2setup();
        mode = LEVEL2;
      }
    }
  }
}
