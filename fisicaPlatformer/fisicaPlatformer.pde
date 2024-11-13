import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;
color lightblue = #54ccff;
color brown = #d68b00;
color green = #05e83a;
color purple = #6f3198;


PImage map, ice, stone, treeTrunk, treeIntersect, treeMiddle, treeEndWest, treeEndEast, spike, bridge;
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
  stone = loadImage("images/stone.png");
  ice = loadImage("images/ice.png");
  ice.resize(32, 32);
  treeTrunk = loadImage("images/tree_trunk.png");
  treeIntersect = loadImage("images/tree_intersect.png");
  treeMiddle = loadImage("images/treetop_center.png");
  treeEndWest = loadImage("images/treetop_w.png");
  treeEndEast = loadImage("images/treetop_e.png");
  spike = loadImage("images/spike.png");
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y); //color of pixel
      color s = img.get(x, y+1); //color below pixel
      color w = img.get(x-1, y); //color west of pixel
      color e = img.get(x+1, y); //color east of pixel
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x * gridSize, y * gridSize);
      b.setStatic(true);
      b.setGrabbable(false);
      b.setFriction(4);
      //stone
      if (c == black) {
        b.attachImage(stone);
        b.setName("stone");
        world.add(b);
      }
      //ice
      else if (c == lightblue) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
      }
      //tree
      else if (c == brown) {
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("tree trunk");
        world.add(b);
      }
      //intersection
      else if (c == green && s == brown) {
        b.attachImage(treeIntersect);
        b.setName("treetop");
        world.add(b);
      }
      //mid piece
      else if (c == green && w == green && e == green) {
        b.attachImage(treeMiddle);
        b.setName("treetop");
        world.add(b);
      }
      //west endcap
      else if (c == green && w != green) {
        b.attachImage(treeEndWest);
        b.setName("treetop");
        world.add(b);
      }
      //east endcap
      else if (c == green && e != green) {
        b.attachImage(treeEndEast);
        b.setName("treetop");
        world.add(b);
      }
      //spikes
      else if (c == purple) {
        b.attachImage(spike);
        b.setName("spike");
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

void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FBox b = terrain.get(i);
    if (b instanceof FBridge) ((FBridge) b).act();
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
