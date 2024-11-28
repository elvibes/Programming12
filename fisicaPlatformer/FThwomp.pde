int mode;
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
    mode = waiting;
    state = waiting;
    ogx = x + gridSize/2;
    ogy = y + gridSize/2;
    setDensity(100);
  }

  void act() {
    if (touchingPlayer() && mode == waiting) {
      mode = falling;
    }
    
    if (mode == waiting) {
      setStatic(true);
      setVelocity(0, 0);
    }
    if (mode == falling) {
      setStatic(false);
      attachImage(thwomp1);
    }
    if (getY() >= ogy + 160) {
      attachImage(thwomp0);
      mode = rising;
    }

    if (mode == rising && getY() <= ogy + 210) {
      setVelocity(0, -100);
    }
    
    if (abs(ogy - getY()) < 1) {
      mode = waiting;
    }


    //makeSensor();
  }

  boolean touchingPlayer() {
    return player.getX()>th.getX()-gridSize && player.getX()<th.getX()+gridSize;
  }
}
