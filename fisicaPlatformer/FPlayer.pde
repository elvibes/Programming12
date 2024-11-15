class FPlayer extends FGameObject {
  
  int frame, direction;
  final int L = -1;
  final int R = 1;
  
  FPlayer() {
    super();
    frame = 0;
    direction = 1;
    setPosition(0, 0);
    setName("player");
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    input();
    if (isTouching("spike")) {
      setPosition(0, 0);
    }
    animate();
  }
  
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(action[frame]);
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
    }
    if (dkey) {
      setVelocity(200, vy);
      action = run;
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
