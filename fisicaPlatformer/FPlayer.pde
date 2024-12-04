class FPlayer extends FGameObject {

  int frame, direction, lives;

  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(0, 200);
    setName("player");
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    input();
    if (isTouching("spike")) {
      reset();
    }
    if (isTouching("hammer")) {
      reset();
    }
    if (isTouching("th")) {
      reset();
    }
    if (getY() > 800) {
      reset();
    }

    animate();
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }

  void reset() {
    setPosition(0, 200);
    setVelocity(0, 0);
    direction = R;
    gamereset();
  }

  void input() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 0.1) {
      action = idle;
    }
    if (akey) {
      setVelocity(-200, vy);
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
      direction = R;
    }
    if (wkey && getVelocityY() == 0) {
      setVelocity(vx, -370);
    }
    if (skey) {
      setVelocity(vx, 370);
    }
    if (abs(vy) > 0.1) {
      action = jump;
    }
  }
}
