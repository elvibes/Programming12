class FPlayer extends FGameObject {

  int frame, direction, lives;

  FPlayer() {
    super();
    frame = 0;
    direction = R;
    setPosition(2150, 200);
    setName("player");
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    input();
    if (isTouching("spike")) { 
      reset();
      lives = lives - 1;
    }
    if (isTouching("hammer")) {
      reset();
      lives = lives - 1;
    }
    if (isTouching("th")) {
      reset();
      lives = lives - 1;
    }
    if (direction == L) {
      booMove = false;
    } else {
      booMove = true;
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
      if (switchTouched == true) {
        setVelocity(-300, vy);
      }
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
      direction = R;
      if (switchTouched == true) {
        setVelocity(300, vy);
      }
    }
    if (wkey && getVelocityY() == 0) {
      setVelocity(vx, -380);
    }
    if (skey) {
      setVelocity(vx, 380);
    }
    if (abs(vy) > 0.1) {
      action = jump;
    }
  }
}
