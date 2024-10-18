import fisica.*;

FWorld world;

boolean wkey, akey, skey, dkey;

//-----------------------------------------------------------

void setup() {
  size(800, 600);
  
  //initialize world
  createWorld();
  
  //add land
  makeLand();
  makeAdditionalLand();
  makeFlag();
  makeBall();
}

void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges(#6AA4FF);
}

void makeLand() {
  FBox land = new FBox(width, height/2);
  land.setPosition(width/2, 600);
  
  // define properties
  land.setStatic(true);
  land.setFillColor(#3BFF49);
  land.setStrokeWeight(0);
  land.setFriction(0.1);

  //put it in the world
  world.add(land);
}

void makeAdditionalLand() {
  FBox Aland = new FBox(850, 300);
  Aland.setPosition(215, 530);
  
  FBox Bland = new FBox(200, 300);
  Bland.setPosition(780, 530);
  
  // define properties
  Aland.setStatic(true);
  Aland.setFillColor(#3BFF49);
  Aland.setStrokeWeight(0);
  Aland.setFriction(0.1);
  
  Bland.setStatic(true);
  Bland.setFillColor(#3BFF49);
  Bland.setStrokeWeight(0);
  Bland.setFriction(0.1);
  
  //put it in the world
  world.add(Aland);
  world.add(Bland);
}

void makeFlag() {
  FBox box = new FBox(3, 180);
  box.setPosition(660, height/2 + 60);
  
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
  box.setSensor(true);
  
  flag.setStatic(true);
  flag.setSensor(true);
 
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
  FCircle circle = new FCircle(15);
  circle.setPosition(100, height/2);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(1);
  circle.setFillColor(#FFFFFF);

  //set physical properties
  circle.setDensity(1);
  circle.setFriction(2);
  circle.setRestitution(0.3);

  //add to world
  world.add(circle);
}
