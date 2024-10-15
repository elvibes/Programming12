import fisica.*;

FWorld world;
FPoly land;

boolean wkey, akey, skey, dkey;

void setup() {
  size(800, 800);
  
  //initialize world
  createWorld();
  
  //add land
  makeLand();
}

void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
}

void makeLand() {
  land = new FPoly();
  
  //vertices
  land.vertex(0, height/2);
  land.vertex(600, height/2);
  land.vertex(600, height/2 + 10);
  land.vertex(605, height/2 + 10);
  land.vertex(605, height/2);
  land.vertex(width, height/2);
  land.vertex(width, height);
  land.vertex(0, height);
  
  // define properties
  land.setStatic(true);
  land.setFillColor(0);
  land.setFriction(0.1);

  //put it in the world
  world.add(land);
}

void draw() {
  background(#6AA4FF);
  
  world.draw();
}
