class FLava extends FGameObject {
  int frame = 0;

  FLava (float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
  }

  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 8 == 0) {
      attachImage(lava[frame]);
      frame++;
    }
  }
  
  void collide() {
    if (isTouching("player")) {
      reset();
    }
  }
}
