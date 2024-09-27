class Mover {

  //instance variables
  float x, y, color1, color2, color3;

  //constructor
  Mover() {
    x = width/2;
    y = height/2;
    color1 = random(0, 255);
    color2 = random(0, 255);
    color2 = random(0, 255);
  }

  //behaviour functions
  void show() {
    stroke(0);
    fill(color1, color2, color3);
    strokeWeight(5);
    circle(x, y, 100);
  }

  void act() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }
}
