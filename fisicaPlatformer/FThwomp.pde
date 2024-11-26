class FThwomp extends FGameObject {

  int mode = 1;

  FThwomp(float x, float y) {
    super();
    setPosition(x + 16, y + 15);
    attachImage(thwomp0);
    setName("th");
    setStatic(true);
    setRotatable(false);
  }

  void act() {
    if (touchingPlayer()) {
      setStatic(false);
      attachImage(thwomp1);
      mode++;
    }
    if (getY() >= 400) {
      attachImage(thwomp0);
      if (isTouching("stone")) {
        setVelocity(0, -50);
      }
    }


    //makeSensor();
  }

  boolean touchingPlayer() {
    return player.getX()>th.getX()-gridSize && player.getX()<th.getX()+gridSize;
  }
}
