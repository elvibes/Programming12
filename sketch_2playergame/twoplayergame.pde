//mode variables
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;

//font
PFont Soccer;

//entity variables
float red1x, red1y, red2x, red2y, blue1x, blue1y, blue2x, blue2y, playerd;

//keyboard variables
boolean wkey, skey, akey, dkey, upkey, downkey, leftkey, rightkey;

void setup() {
  size(800, 600);
  
  mode = INTRO;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  Soccer = createFont("Soccer.otf", 200);
  
  //intialize players
  red1x = 300;
  red1y = height/2;
  red2x = 55;
  red2y = height/2;
  blue1x = 500;
  blue1y = height/2;
  blue2x = 745;
  blue2y = height/2;
  playerd = 60;
  
  //initialize keyboard variables
  wkey = skey = akey = dkey = upkey = downkey = leftkey = rightkey = false;
}

void draw() {
  textFont(Soccer);
  if(mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}

void soccerfield() {
  noStroke();
  background(38, 224, 74);
  fill(29, 170, 56);
  
  int x = 25;
  while(x < 800) {
    rect(x, 300, 50, 600);
    x = x + 100;
  }
}
