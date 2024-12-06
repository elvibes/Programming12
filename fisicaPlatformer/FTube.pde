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
      if (player.getY() < getY() - gridSize/2) {
        setSensor(true);
        player.setVelocity(player.getVelocityX(), 100);
      } else {
        setSensor(false);
      }
    }
  }
}
