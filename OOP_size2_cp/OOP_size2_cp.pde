Mover[] myMovers;
int n = 50;

void setup() {
  size(300, 300);
  myMovers = new Mover[n];
  int i = 0;
  while (i < n) {
    myMovers[i] = new Mover();
    i++;
  }
}

void draw() {
  background(0);
  int i = 0;
  while (i < n) {
    myMovers[i].act();
    myMovers[i].show();
    i++;
  }
}
