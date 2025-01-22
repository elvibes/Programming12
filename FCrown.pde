class FCrown extends FGameObject {

  FCrown(float x, float y) {
    super();
    setPosition(x, y);
    setName("crown");
    setRotatable(false);
    setSensor(true);
    setStatic(true);
  }

  void act() {
    attachImage(gold);
    collide();
  }



  void collide() {
    if (isTouching("player")) {
      mode = GAMEOVER;
      win = true;
    }
  }
}
