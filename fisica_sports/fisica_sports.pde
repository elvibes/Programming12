import fisica.*;

FWorld world;
FPoly land;

boolean wkey, akey, skey, dkey;

//-----------------------------------------------------------

void setup() {
  size(800, 600);
  
  //initialize world
  createWorld();
  
  //add land
  makeLand();
  //makeFlag();
  makeBall();
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
  land.vertex(0, height/2 + 50);
  land.vertex(650, height/2 + 50);
  land.vertex(650, height/2 + 70);
  land.vertex(665, height/2 + 70);
  land.vertex(665, height/2 + 50);
  land.vertex(width, height/2 + 50);
  land.vertex(width, height + 50);
  land.vertex(0, height + 50);
  
  // define properties
  land.setStatic(true);
  land.setFillColor(#3BFF49);
  land.setFriction(0.1);

  //put it in the world
  world.add(land);
}

void makeFlag() {
  FBox box = new FBox(3, 100);
  box.setPosition(658, height/2 + 18);
  
  FPoly flag = new FPoly();
  
  flag.vertex(658, height/2 - 30);
  flag.vertex(690, height/2 - 15);
  flag.vertex(658, height/2);

  //set visuals
  box.setStroke(255);
  box.setStrokeWeight(2);
  box.setFillColor(#FFFFFF);
  flag.setStroke(255, 0, 4);
  flag.setFillColor(#FF0004);

  //set physical properties
  box.setStatic(true);
  box.setFriction(0.1);
  
  flag.setStatic(true);
 
  world.add(box);
  world.add(flag);
}

//----------------------------------------------------------

void draw() {
  background(#6AA4FF);
  world.step();
  world.draw();
  
}

void makeBall() {
  FCircle circle = new FCircle(20);
  circle.setPosition(100, height/2);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(1);
  circle.setFillColor(#FFFFFF);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}
