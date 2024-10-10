class Mover {
  
  //instance variables
  PVector loc;
  PVector vel;
  float d;
  boolean alive;
  
  //constructors
  Mover() {
    d = 100;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (1, 0);
    vel.setMag(random(1, 5)); //could be different velocity but same direction
    vel.rotate(radians(45)); //could be different directions but same velocity
    alive = true;
  }
  
  Mover(float x, float y) {
    d = 100;
    loc = new PVector (x, y);
    vel = new PVector (1, 0);
    vel.setMag(random(1, 5)); //could be different velocity but same direction
    vel.rotate(radians(45)); //could be different directions but same velocity
    alive = true;
  }
  
  
  void act() {
    move();
    bounceOffEdge();
    checkForDeletion();
  }
  
  void checkForDeletion() {
    if (dist(loc.x, loc.y, mouseX, mouseY) < d/2 && mousePressed) {
      alive = false;
    }
  }
  
  void move() {
    loc.add(vel);
  }
  
  void bounceOffEdge() {
    if (loc.x < 0 || loc.x > width) vel.x = -vel.x;
    if (loc.y < 0 || loc.y > height) vel.y = -vel.y;
  }
  
  void showBody() {
    noStroke();
    fill(255, 100);
    circle(loc.x, loc.y, d);
  }
  
  void showConnections() {
    for (int i = 0; i < movers.size(); i++) {
      Mover other = movers.get(i);
      float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
  }
  
}
