class FThwomp extends FGameObject {
  
  FThwomp(float x, float y) {
    super();
    setPosition(x + 16, y + 15);
    attachImage(thwomp0);
    setName("th");
    setStatic(true);
  }
  
  void act() {
    //if (isTouching("player")) {
    //  setStatic(false);
    //  setSensor(true);
    //}
    makeSensor();
  }
}
