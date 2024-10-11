import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//global variables
float cloud1x, cloud1y, cloud2x, cloud2y, vx;
boolean mouseReleased;
boolean wasPressed;

boolean gravity, newElement;

Button[] myButtons;


//assets
PImage redBird;
PImage creeper;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  cloud1x = 50;
  cloud1y = 150;
  vx = 5;
  
  cloud2x = 1500;
  cloud2y = 700;

  //load resources
  redBird = loadImage("red-bird.png");
  creeper = loadImage("creeper.png");
  
  //initialize buttons
  myButtons = new Button[2];
  myButtons[0] = new Button(true, 200, 400, 100, 100, 255, 0);
  myButtons[1] = new Button(200, 600, 100, 100, 255, 0, true);

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(width*0.75, height*0.4+85);
  bottomPlatform.vertex(width*0.8, height*0.4+100);
  bottomPlatform.vertex(width*0.8, height*0.4+400);
  bottomPlatform.vertex(width*0.95, height*0.4+400);
  bottomPlatform.vertex(width*0.95, height*0.4);
  bottomPlatform.vertex(width*0.99, height*0.4);
  bottomPlatform.vertex(width*0.99, height*0.4+450);
  bottomPlatform.vertex(width*0.75, height*0.4+450);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  
  
  world.step();  //get box2D to calculate all the forces and new positions
  cloud1();
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  cloud2();
  
  click();
  for (int i = 0; i < 2; i++) {
    myButtons[i].show();
    if (myButtons[0].clicked) {
      gravity = !gravity;
      println("yes");
    } 
    
    if (myButtons[1].clicked) {
      newElement = !newElement;
      
    }
  }
}

void cloud1() {
  noStroke();
  fill(255);
  circle(cloud1x, cloud1y, 70);
  circle(cloud1x-40, cloud1y, 70);
  circle(cloud1x+40, cloud1y, 70);
  circle(cloud1x, cloud1y-40, 70);
  cloud1x = cloud1x + vx;
  
  if (cloud1x > width + 100) cloud1x = -100;
}

void cloud2() {
  noStroke();
  fill(255);
  circle(cloud2x, cloud2y, 70);
  circle(cloud2x-40, cloud2y, 70);
  circle(cloud2x+40, cloud2y, 70);
  circle(cloud2x, cloud2y-40, 70);
  cloud2x = cloud2x - vx;
  
  if (cloud2x < -100) cloud2x = width + 100;
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), -5);

  //set visuals
  box.attachImage(creeper);
  creeper.resize(0, 60);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
