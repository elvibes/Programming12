import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;
color lightblue = #54ccff;
color brown = #d68b00;
color green1 = #00992b;
color middlegreen = #05e83a;
color green3 = #002e0b;
color green5 = #004d14;

PImage map, ice, stone, treeTrunk;
int gridSize = 32;
float zoom = 2;
//keyboard variables
boolean wkey, skey, akey, dkey, qkey, ekey, spacekey, upkey, downkey, leftkey, rightkey;

FPlayer player;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  map = loadImage("map.png");
  stone = loadImage("stone.png");
  ice = loadImage("ice.png");
  ice.resize(32, 32);
  treeTrunk =loadImage("tree_trunk.png");
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x * gridSize, y * gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      //stone
      if (c == black) {
        b.attachImage(stone);
        b.setFriction(4);
        b.setName("stone");
        world.add(b);
      }
      //ice
      if (c == lightblue) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      //tree
      if (c == brown) {
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("tree trunk");
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
