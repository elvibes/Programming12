class Particle extends GameObject {
  PVector dir;
  float a;

  Particle(PVector loc) {
    super(loc.x, loc.y, loc.z, 8);
    a = 255;

    dir = new PVector(random(-5, 5), random(-5, 5), random(-5, 5));
  }

  void act() {
    int hitx = int(loc.x + 2000)/gridSize;
    int hity = int(loc.z + 2000)/gridSize;

    if (map.get(hitx, hity) != white) {
      loc.add(dir);
    }
  }

  void show() {
    if (frameCount % 2 == 0) {
      a = max(a-1, 0);
    }
    fill(white, a);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    box(size);
    popMatrix();
  }
}
