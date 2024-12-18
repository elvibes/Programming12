class FBoo extends FGameObject {

  int direction = R;
  int speed = 180;
  int frame = 0;

  FBoo(float x, float y) {
    super();
    setPosition(x, y);
    setName("boo");
    setRotatable(false);
    setDrawable(false);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    animate();
    collide();

    if (booMove == true) {
      move();
    }

    if (booMove == false) {
      bo.attachImage(happyboo);
    }
  }

  void animate() {
    if (frame >= boo.length) frame = 0;
    if (frameCount % 10 == 0) {
      boo[frame].resize(32, 32);
      if (direction == R) attachImage(boo[frame]);
      frame++;
    }
  }

  void collide() {
    if (player.getX() > 1300) {
      setDrawable(true);
      setStatic(false);
      setSensor(false);
    }
    if (isTouching("sh")) {
      world.remove(this);
      enemies.remove(this);
    }
    if (isTouching("player") && player.getX() > 1300) {
      if (player.getY() < getY() - gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -300);
      } else {
        reset();
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
