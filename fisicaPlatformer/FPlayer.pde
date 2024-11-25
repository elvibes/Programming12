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
      setPosition(0, 200);
    }
    if (isTouching("hammer")) {
      setPosition(0, 200);
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
    if (wkey) {
      setVelocity(vx, -200);
    }
    if (skey) {
      setVelocity(vx, 200);
    }
    if (abs(vy) > 0.1) {
      action = jump;
    }
  }
}
