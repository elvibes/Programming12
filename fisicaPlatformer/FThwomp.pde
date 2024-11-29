final int waiting = 1;
final int falling = 2;
final int rising = 3;

class FThwomp extends FGameObject {
  
  int state;
  float ogx, ogy;

  FThwomp(float x, float y) {
    super();
    setPosition(x + gridSize/2, y + gridSize/2);
    attachImage(thwomp0);
    setName("th");
    setStatic(true);
    setRotatable(false);
    state = waiting;
    ogx = x + gridSize/2;
    ogy = y + gridSize/2;
    setDensity(100);
  }

  void act() {
    if (touchingPlayer() && state == waiting) {
      state = falling;
    }
    
    if (state == waiting) {
      setStatic(true);
      setVelocity(0, 0);
    }
    if (state == falling) {
      setStatic(false);
      attachImage(thwomp1);
    }
    if (getY() >= ogy + 160) {
      attachImage(thwomp0);
      state = rising;
    }

    if (state == rising && getY() <= ogy + 210) {
      setVelocity(0, -100);
    }
    
    if (abs(ogy - getY()) < 1) {
      state = waiting;
    }


    //makeSensor();
  }

  boolean touchingPlayer() {
    return player.getX() > getX()-gridSize && player.getX() < getX()+gridSize && player.getY() > getY();
  }
}
