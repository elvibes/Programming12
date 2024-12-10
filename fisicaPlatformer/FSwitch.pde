class FSwitch extends FGameObject {

  FSwitch(float x, float y) {
    super();
    setPosition(x, y);
    setName("switch");
    setRotatable(false);
    setStatic(true);
  }

  void act() {
    collide();
  }

  void collide() {
    if (switchTouched == false) attachImage(off);
    if (isTouching("player")) {
      if (player.getY() > getY() - gridSize/2) {
        switchTouched = true;
      } 
    }
    if (switchTouched == true) attachImage(on);
  }
}
