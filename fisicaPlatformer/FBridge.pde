class FBridge extends FBox {
  
  FBridge(float x, float y) {
    super(gridSize, gridSize);
    setPosition(x, y);
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
  }
  
  void act() {
    checkForCollisions();
  }
  
  //void checkForCollisions() {
  //  ArrayList<FContact> contacts = getContacts();
  //  for (int i = 0; i < contacts.size(); i++) {
  //    FContact fc = contacts.get(i);
  //    if (fc.contains("spike")) {
  //      setPosition(0, 0);
  //    }
  //  }
  //}
}
