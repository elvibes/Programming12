import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;

PImage map;
int gridSize = 32;

//keyboard variables
boolean wkey, skey, akey, dkey, qkey, ekey, spacekey, upkey, downkey, leftkey, rightkey;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  map = loadImage("map.png");
  loadWorld(map);
}

void loadWorld(PImage img) {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x * gridSize, y * gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}
void draw() {
  background(white);
  world.step();
  world.draw();
}
