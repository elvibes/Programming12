class Mover {
  
  //instance variables
  PVector loc;
  PVector vel;
  float d;
  
  //constructor
  Mover() {
    d = 100;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (random(-5, 5), random(-5, 5));
  }
  
  
  void act() {
    move();
    bounceOffEdge();
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
    fill(255, 50);
    circle(loc.x, loc.y, d);
  }
  
  void showConnections() {
    for (int i = 0; i < numberOfMovers; i++) {
      float dist = dist(loc.x, loc.y, movers[i].loc.x, movers[i].loc.y);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, movers[i].loc.x, movers[i].loc.y);
      }
    }
  }
  
}
