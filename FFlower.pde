class FFlower extends FGameObject {

  FFlower(float x, float y) {
    super();
    setPosition(x, y);
    setName("fl");
    setRotatable(false);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    attachImage(iceflower);
    collide();
  }

  void collide() {
    if (isTouching("player") && powerTouched == true) {
      world.remove(this);
      enemies.remove(this);
    }
  }
}
