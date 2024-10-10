ArrayList<Mover> movers;
int numberOfMovers = 50;

void setup() {
  size(800, 800);
  movers = new ArrayList(); //instantiate Arraylist
  
  for(int i = 0; i < numberOfMovers; i++) {
    movers.add(new Mover()); //calling Mover constructor
  }
}

void draw() {
  background(#b7e4c7);
  for (int i = 0; i < movers.size();) {
    Mover m = movers.get(i); //.get(i) == getting a mover out of ArrayList at index i
    m.act(); 
    m.showBody();
    m.showConnections();
    if (m.alive == false) {
      movers.remove(i);
    } else {
      i++;
    }
  }
}

void mouseReleased() {
  //movers.add(new Mover(mouseX, mouseY));
}
