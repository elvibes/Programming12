class FSuperBlock extends FGameObject {

  int frame = 0;

  FSuperBlock(float x, float y) {
    super();
    setPosition(x, y);
    setName("powerblock");
    setRotatable(false);
    setSensor(false);
    setStatic(true);
  }

  void act() {
    animate();
    collide();
  }

  void animate() {
    if (frame >= power.length) frame = 0;
    if (frameCount % 10 == 0) {
      attachImage(power[frame]);
      frame++;
    }
  }

  void collide() {
    if (isTouching("player")) {
      if (player.getY() > getY() - gridSize/2) {
        powerTouched = true;
        enemies.add(fl);
        world.add(fl);
      }
    }
    if (powerTouched == true) {
      attachImage(poweroff);
    }
  }
}
