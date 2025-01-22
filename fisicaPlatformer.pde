import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #ed1c24;
color lightblue = #54ccff;
color brown = #d68b00;
color green = #05e83a;
color purple = #6f3198;
color pink = #ffa3b1;
color grey = #464646;
color yellow = #fff200;
color orange = #ff7e00;
color lightpurple = #b5a5d5;
color blue = #4d6df3;
color dgreen = #002e0b;
color lgrey = #b4b4b4;
color yorange = #ffc342;
color mgreen = #00992b;
color dred = #990030;
color peach = #e5aa7a;
color blossom = #f389f5;
color sky = #0098dc;
color grape = #7a09fa;
color aurora = #3003d9;
color beige = #f9e6cf;
color plum = #3b1443;
color mint = #6febb3;
color leaf = #baba30;


PImage map, map2, ice, stone, treeTrunk, treeIntersect, treeMiddle, treeEndWest, treeEndEast, spike, bridge;
PImage trampoline, hammerimg, thwomp0, thwomp1, cpStart, cpPressed, tube, on, off, happyboo, poweroff, iceflower, iceball, bkgmario, lose, winimg, heart, skybkg, gold;
PImage[] idle, jump, run, action;
PImage[] goomba;
PImage[] lava;
PImage[] hammerbro;
PImage[] coin;
PImage[] koopa;
PImage[] shell;
PImage[] boo;
PImage[] power;

final int L = -1;
final int R = 1;

int mode;
final int INTRO = 1;
final int LEVEL1 = 2;
final int LEVEL2 = 3;
final int GAMEOVER = 4;

int direction = R;

FHammerBro hb;
FBox hammer;
FThwomp th;
FBox thSensor;
FKoopa kp;
FShell sh;
FBoo bo;
FSuperBlock pw;
FFlower fl;
FBox iceb;
FCrown crown;


int gridSize = 32;
float zoom = 1.2;
//keyboard variables
boolean wkey, skey, akey, dkey, qkey, ekey, spacekey, upkey, downkey, leftkey, rightkey;

FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

int coini, lives;
float cpogx, cpogy;
boolean cpTouched, switchTouched, booMove, powerTouched, iceMode, win;

void setup() {
  size(600, 600);
  Fisica.init(this);

  mode = INTRO;

  coini = 0;
  lives = 3;
  cpTouched = false;
  switchTouched = false;
  booMove = true;
  powerTouched = false;
  iceMode = false;
  win = false;


  map = loadImage("map.png");
  map2 = loadImage("map2.png");
  stone = loadImage("images/stone.png");
  ice = loadImage("images/ice.png");
  ice.resize(32, 32);
  treeTrunk = loadImage("images/tree_trunk.png");
  treeIntersect = loadImage("images/tree_intersect.png");
  treeMiddle = loadImage("images/treetop_center.png");
  treeEndWest = loadImage("images/treetop_w.png");
  treeEndEast = loadImage("images/treetop_e.png");
  spike = loadImage("images/spike.png");
  bridge = loadImage("images/bridge_center.png");
  trampoline = loadImage("enemiesImages/trampoline.png");
  hammerimg = loadImage("enemiesImages/hammer.png");
  thwomp0 = loadImage("enemiesImages/thwomp0.png");
  thwomp1 = loadImage("enemiesImages/thwomp1.png");
  cpStart = loadImage("images/cp0.png");
  cpPressed = loadImage("images/cp1.png");
  tube = loadImage("images/tube.png");
  on = loadImage("images/on.png");
  off = loadImage("images/off.png");
  happyboo = loadImage("images/happyboo.png");
  happyboo.resize(42, 32);
  poweroff = loadImage("images/nopower.png");
  iceflower = loadImage("images/iceflower.png");
  iceball = loadImage("images/iceball.png");
  iceball.resize(16, 16);
  bkgmario = loadImage("images/mariobros.png");
  bkgmario.resize(600, 600);
  lose = loadImage("images/lose.png");
  lose.resize(600, 600);
  skybkg = loadImage("images/skybkg.png");
  skybkg.resize(600, 600);
  heart = loadImage("images/heart.png");
  heart.resize(40, 40);
  gold = loadImage("images/gold.png");
  winimg = loadImage("images/winimg.png");
  winimg.resize(600, 600);

  //load actions
  //mario
  idle = new PImage[2];
  idle[0] = loadImage("imageReverser/idle0.png");
  idle[1] = loadImage("imageReverser/idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("imageReverser/jump0.png");

  run = new PImage[3];
  run[0] = loadImage("imageReverser/runright0.png");
  run[1] = loadImage("imageReverser/runright1.png");
  run[2] = loadImage("imageReverser/runright2.png");

  action = idle;

  //enemies
  goomba = new PImage[2];
  goomba[0] = loadImage("enemiesImages/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("enemiesImages/goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  coin = new PImage[4];
  coin[0] = loadImage("images/coin0.png");
  coin[1] = loadImage("images/coin1.png");
  coin[2] = loadImage("images/coin2.png");
  coin[3] = loadImage("images/coin3.png");

  //lava
  lava = new PImage[6];
  lava[0] = loadImage("images/lava0.png");
  lava[1] = loadImage("images/lava1.png");
  lava[2] = loadImage("images/lava2.png");
  lava[3] = loadImage("images/lava3.png");
  lava[4] = loadImage("images/lava4.png");
  lava[5] = loadImage("images/lava5.png");
  lava[5].resize(32, 32);

  //hammerbro
  hammerbro = new PImage[2];
  hammerbro[0] = loadImage("enemiesImages/hammerbro0.png");
  hammerbro[1] = loadImage("enemiesImages/hammerbro1.png");

  //koopa troopa
  koopa = new PImage[5];
  koopa[0] = loadImage("images/kp0.png");
  koopa[1] = loadImage("images/kp1.png");
  koopa[2] = loadImage("images/kp2.png");
  koopa[3] = loadImage("images/kp3.png");
  koopa[4] = loadImage("images/kp4.png");

  //shell
  shell = new PImage[4];
  shell[0] = loadImage("images/shell0.png");
  shell[1] = loadImage("images/shell1.png");
  shell[2] = loadImage("images/shell2.png");
  shell[3] = loadImage("images/shell3.png");

  //boo
  boo = new PImage[4];
  boo[0] = loadImage("images/boo0.png");
  boo[1] = loadImage("images/boo1.png");
  boo[2] = loadImage("images/boo2.png");
  boo[3] = loadImage("images/boo3.png");

  //power
  power = new PImage[4];
  power[0] = loadImage("images/super0.png");
  power[1] = loadImage("images/super1.png");
  power[2] = loadImage("images/super2.png");
  power[3] = loadImage("images/super3.png");

  game1reset();
  if (mode == LEVEL2) level2setup();
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
      //wall
      if (c == grey) {
        b.attachImage(stone);
        b.setName("wall");
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
      //bridge
      else if (c == pink) {
        FBridge br = new FBridge(x * gridSize, y * gridSize);
        terrain.add(br);
        world.add(br);
      }
      //goomba
      else if (c == yellow) {
        FGoomba gmb = new FGoomba(x * gridSize, y * gridSize);
        enemies.add(gmb);
        world.add(gmb);
      }
      //trampoline
      else if (c == red) {
        b.attachImage(trampoline);
        b.setName("trampoline");
        b.setRestitution(2.5);
        world.add(b);
      }
      //lava
      else if (c == orange) {
        FLava lava = new FLava(x * gridSize, y * gridSize);
        enemies.add(lava);
        world.add(lava);
      }
      //hammer bro
      else if (c == lightpurple) {
        hb = new FHammerBro(x * gridSize, y * gridSize);
        enemies.add(hb);
        world.add(hb);
      }
      //hammerbro wall
      else if (c == blue) {
        b.setName("hwall");
        b.setSensor(true);
        b.setDrawable(false);
        world.add(b);
      }
      //thwomp
      else if (c == dgreen) {
        th = new FThwomp(x * gridSize, y * gridSize);
        enemies.add(th);
        world.add(th);
      }
      //coin
      else if (c == yorange) {
        FCoin cn = new FCoin(x * gridSize, y * gridSize);
        enemies.add(cn);
        world.add(cn);
      }
      //checkpoint
      else if (c == mgreen) {
        FCp cp = new FCp(x * gridSize, y * gridSize);
        enemies.add(cp);
        world.add(cp);
      }
      //tube
      else if (c == dred) {
        FTube tb = new FTube(x * gridSize, y * gridSize);
        enemies.add(tb);
        world.add(tb);
      }
      //switch
      else if (c == peach) {
        FSwitch sw = new FSwitch(x * gridSize, y * gridSize);
        enemies.add(sw);
        world.add(sw);
      }
      //koopa troopa
      else if (c == blossom) {
        kp = new FKoopa(x * gridSize, y * gridSize);
        enemies.add(kp);
        world.add(kp);
      }
      //hammerbro wall
      else if (c == sky) {
        b.setName("kpwall");
        b.setSensor(true);
        b.setDrawable(false);
        world.add(b);
      }
      //shell
      else if (c == grape) {
        sh = new FShell(x * gridSize, y * gridSize);
      }
      //boo
      else if (c == beige) {
        bo = new FBoo(x * gridSize, y * gridSize);
        enemies.add(bo);
        world.add(bo);
      }
      //superpower
      else if (c == plum) {
        pw = new FSuperBlock(x * gridSize, y * gridSize);
        enemies.add(pw);
        world.add(pw);
      }
      //ice flower
      else if (c == mint) {
        fl = new FFlower(x * gridSize, y * gridSize);
      }
      //crown
      else if (c == leaf) {
        crown = new FCrown(x * gridSize, y * gridSize);
        enemies.add(crown);
        world.add(crown);
      }
    }
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void draw() {
  background(skybkg);
  drawWorld();
  actWorld();

  if (mode == INTRO) {
    intro();
  } else if (mode == LEVEL1) {
    level1();
  } else if (mode == LEVEL2) {
    level2();
  } else if (mode == GAMEOVER) {
    gameover();
  }

  textSize(30);
  fill(white);
  if (mode == LEVEL2) {

    image(coin[0], 25, 25);
    image(heart, 150, 20);
    text(coini, 70, 50);
    text(lives, 200, 50);
  } else if (mode == LEVEL1) {

    image(coin[0], 25, 25);
    text(coini, 70, 50);
    image(heart, 150, 20);
    text(lives, 200, 50);
  } else {
  }
}

void makeHammer() {
  hammer = new FBox(gridSize, gridSize);
  hammer.attachImage(hammerimg);
  hammer.setPosition(hb.getX(), hb.getY());
  hammer.setName("hammer");

  hammer.setAngularVelocity(10);
  if (direction == R) hammer.setVelocity(-150, -400);
  if (direction == L) hammer.setVelocity(150, -400);
  hammer.setSensor(true);

  world.add(hammer);
}

void makeIceBall() {
  iceb = new FBox(gridSize, gridSize);
  iceb.attachImage(iceball);
  iceb.setPosition(player.getX(), player.getY());
  iceb.setName("iceb");

  iceb.setAngularVelocity(5);
  if (player.direction == R && ekey) iceb.setVelocity(300, -200);
  if (player.direction == L && ekey) iceb.setVelocity(-300, -200);
  iceb.setSensor(true);

  world.add(iceb);
}


void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
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

void game1reset() {
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  world = new FWorld(-3000, -3000, 3000, 3000);
  world.setGravity(0, 900);
  loadWorld(map);
  loadPlayer();
  cpTouched = false;
  switchTouched = false;
  powerTouched = false;
  iceMode = false;
}

void game2reset() {
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  world = new FWorld(-3000, -3000, 3000, 3000);
  world.setGravity(0, 900);
  loadWorld(map2);
  loadPlayer();
  player.setPosition(190, 350);
  cpTouched = false;
}

void reset() {
  if (lives > 1) {
    if (cpTouched == true) {
      player.setPosition(cpogx, cpogy);
      player.setVelocity(0, 0);
      direction = R;
      lives = lives - 1;
    } else {
      lives = lives - 1;
      player.setPosition(150, 200);
    }
  } else {
    mode = GAMEOVER;
    cpTouched = false;
    switchTouched = false;
    powerTouched = false;
    iceMode = false;
    win = false;
  }
}
