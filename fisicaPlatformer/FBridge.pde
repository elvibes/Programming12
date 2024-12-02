class FBridge extends FGameObject {
  
  float ogx, ogy;
  
  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(bridge);
    setName("bridge");
    setStatic(true);
    setFriction(4);
    ogx = x;
    ogy = y;
  }
  
  void act() {
    if (isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
    
    if (player.getX() == 0) {
      
    }
  }
}
