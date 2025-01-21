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
      if (mode == LEVEL1 && player.getY() < getY() - gridSize/2 && rightkey == true) {
        level2setup();
        mode = LEVEL2;
      }
      if (mode == LEVEL2 && player.getY() < getY() - gridSize/2 && leftkey == true) {
        level1setup();
        player.setPosition(2270, 350);
        mode = LEVEL1;
      }
    }
  }
}
