class FPlayer extends FBox {
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(0, 0);
    setName("player");
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    handleInput();
    checkForCollisions();
  }
  
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity(-200, vy);
    if (dkey) setVelocity(200, vy);
    if (wkey) setVelocity(vx, -200);
    if (skey) setVelocity(vx, 200);
  }
  
  void checkForCollisions() {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains("spike")) {
        setPosition(0, 0);
      }
    }
  }
}
