class FShell extends FGameObject {

  int direction = R;
  int speed = 200;
  int frame = 0;

  FShell(float x, float y) {
    super();
    setPosition(x, y);
    setName("sh");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= shell.length) frame = 0;
    if (frameCount % 8 == 0) {
      shell[frame].resize(32, 32);
      attachImage(shell[frame]);
      frame++;
    }
  }

  void collide() {
    if (getX() > 2310) {
      world.remove(this);
      enemies.remove(this);
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
