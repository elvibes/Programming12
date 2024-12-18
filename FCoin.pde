class FCoin extends FGameObject {

  int frame = 0;

  FCoin(float x, float y) {
    super();
    setPosition(x, y);
    setName("coin");
    setRotatable(false);
    setSensor(true);
    setStatic(true);
  }

  void act() {
    animate();
    collide();
  }

  void animate() {
    if (frame >= coin.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(coin[frame]);
      frame++;
    }
  }

  void collide() {
    if (isTouching("player")) {
      coini = coini + 1;
      world.remove(this);
      enemies.remove(this);
    }
  }
}
