Mover[] myMovers;
int n = 50;

void setup() {
  size(600, 600);
  myMovers = new Mover[n];
  int i = 0;
  while (i < n) {
    myMovers[i] = new Mover();
    i++;
  }
}

void draw() {
  background(0);
  myMover.act();
  myMover.show();
}
