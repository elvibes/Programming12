Mover[] movers;
int numberOfMovers = 50;

void setup() {
  size(800, 800);
  movers = new Mover[numberOfMovers]; //instantiate array
  
  for(int i = 0; i < numberOfMovers; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(#b7e4c7);
  for (int i = 0; i < numberOfMovers; i++) {
    movers[i].act();
    movers[i].showBody();
    movers[i].showConnections();
  }
}
