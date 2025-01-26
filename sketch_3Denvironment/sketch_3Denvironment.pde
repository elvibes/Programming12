import java.awt.Robot;

//color pallette
color black = #000000; //blackstone
color white = #FFFFFF;
color grayblue = #7092be; //mossystone

//textures
PImage mossyStone, blackstone, sand;

//map variables
int gridSize;
PImage map;

boolean skipFrame;
Robot rbt;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey = skey = dkey = false;
  eyeX = width/2;
  eyeY = 9*height/10;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle = radians(270);
  //noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  //initialize map
  map = loadImage("map.png");
  gridSize = 100;

  mossyStone = loadImage("moss.png");
  blackstone = loadImage("blackstone.png");
  sand = loadImage("sand.png");
}

void draw() {
  background(0);

  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);

  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height-gridSize*4, gridSize);
  drawFocalPoint();
  controlCamera();
  drawMap();
}



void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(255, 0, 0);
  sphere(5);
  popMatrix();
}
