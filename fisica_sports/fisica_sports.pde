import fisica.*;

//mode variables
int mode;
final int INTRO = 1;
final int LEVEL1 = 2;
final int LEVEL2 = 3;
final int LEVEL3 = 4;
final int GAMEOVER = 5;

FWorld world;
FCircle ball;
FBox pole;
FPoly flag;
FBox Aland, Bland;
FBox hole;

//instance variables
PVector loc, direction, vel;

boolean wkey, akey, skey, dkey, ekey;

//-----------------------------------------------------------

void setup() {
  size(800, 600);

  mode = INTRO;

  //loc = new PVector(ball.getX(), ball.getY());
  direction = new PVector(100, 372);
  vel = new PVector(0, 0);

  //initialize world
  createWorld();
}

void createWorld() {
  //init world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
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

void make1Land() {
  Aland = new FBox(850, 300);
  Aland.setPosition(220, 530);

  Bland = new FBox(200, 300);
  Bland.setPosition(775, 530);

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
  pole = new FBox(3, 180);
  pole.setPosition(660, height/2 + 60);

  flag = new FPoly();

  flag.vertex(658, height/2 - 30);
  flag.vertex(690, height/2 - 15);
  flag.vertex(658, height/2);

  //set visuals
  pole.setStroke(255);
  pole.setStrokeWeight(2);
  pole.setFillColor(#FFFFFF);

  flag.setStroke(255, 0, 4);
  flag.setFillColor(#FF0004);

  //set physical properties
  pole.setStatic(true);
  pole.setFriction(0.1);
  pole.setSensor(true);

  flag.setStatic(true);
  flag.setSensor(false);

  world.add(pole);
  world.add(flag);
}

//----------------------------------------------------------

void draw() {
  background(#6AA4FF);

  if (mode == INTRO) {
    intro();
  } else if (mode == LEVEL1) {
    level1();
  } else if (mode == LEVEL2) {
    level2();
  } else if (mode == LEVEL3) {
    level3();
  } else if (mode == GAMEOVER) {
    gameover();
  }
  world.step();
  world.draw();

  if (akey) direction.x = direction.x - 3;
  if (dkey) direction.x = direction.x + 3;
  if (wkey) direction.y = direction.y - 3;
  if (skey) direction.y = direction.y + 3;
  if (ekey == true) ball.setVelocity(direction.x - ball.getX(), direction.y - ball.getY()*1.2);
}

void makeBall() {
  ball = new FCircle(15);
  ball.setPosition(100, 372);


  //set visuals
  ball.setStroke(0);
  ball.setStrokeWeight(1);
  ball.setFillColor(#FFFFFF);

  //set physical properties
  ball.setDensity(1);
  ball.setFriction(2);
  ball.setRestitution(0.3);

  //add to world
  world.add(ball);
}

void makeLine() {
  stroke(0);
  strokeWeight(1);
  if (abs(ball.getVelocityX()) > 1) noStroke();
  line(ball.getX(), ball.getY(), direction.x, direction.y);
}

void makeHole() {
  hole = new FBox(30, 35);
  hole.setPosition(660, height/2 + 150);
  
  hole.setStroke(#000000);
  hole.setStrokeWeight(0);
  hole.setFillColor(#000000);
  
  hole.setStatic(true);
  hole.setFriction(0.1);
  hole.setSensor(true);
  
  world.add(hole);
}
