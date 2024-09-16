//mode variables
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;

//font
PFont Soccer;

void setup() {
  size(800, 600);
  
  mode = INTRO;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
  Soccer = createFont("Soccer.otf", 200);
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
