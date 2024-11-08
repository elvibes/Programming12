import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;

PImage map;
int gridSize = 32;
float zoom = 1.5;
//keyboard variables
boolean wkey, skey, akey, dkey, qkey, ekey, spacekey, upkey, downkey, leftkey, rightkey;

FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  map = loadImage("map.png");
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x * gridSize, y * gridSize);
        b.setStatic(true);
        b.setFill(black);
        b.setGrabbable(false);
        world.add(b);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
  
}
void draw() {
  background(white);
  drawWorld();
  player.act();
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
