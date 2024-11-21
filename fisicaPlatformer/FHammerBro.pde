class FHammerBro extends FGameObject {

  
  int speed = 50;
  int frame = 0;

  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= hammerbro.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (direction == R) {
        attachImage(hammerbro[frame]);
      }
      if (direction == L) {
        attachImage(reverseImage(hammerbro[frame]));
      }
      frame++;
    }
  }

  void collide() {
    if (isTouching("hwall")) {
      direction *= -1;
      setPosition(getX() + direction*1.5, getY());
      makeHammer();
    }
    //if (isTouching("player")) {
    //  if (player.getY() < getY() - gridSize/2) {
    //    world.remove(this);
    //    enemies.remove(this);
    //    player.setVelocity(player.getVelocityX(), -300);
    //  } else {
    //    player.setPosition(0, 200);
    //  }
    //}
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
  }
}
