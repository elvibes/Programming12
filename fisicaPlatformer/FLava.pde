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
  }

  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(lava[frame]);
      frame++;
    }
  }
}
