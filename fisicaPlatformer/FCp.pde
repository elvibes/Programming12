class FCp extends FGameObject {

  FCp(float x, float y) {
    super();
    setPosition(x, y);
    setName("cp");
    setRotatable(false);
    setStatic(true);
    setSensor(true);
    cpogx = x;
    cpogy = y;
  }

  void act() {
    if (cpTouched == false) attachImage(cpStart);
    collide();
  }

  void collide() {
    if (isTouching("player")) cpTouched = true;
    if (cpTouched) attachImage(cpPressed);
  }
}
