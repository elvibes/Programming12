void setup() {
  size(800, 800);
  background(255);
  noStroke();
 
  rocket(300, 200);
}


void rocket(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  scale(random(0.2, 1));
  
  body();
  head();
  window();
  fire();
  
  popMatrix();
}

void body() {
  fill(189, 124, 255);
  rect(0, 0, 200, 300);
}

void head() {
  fill(124, 135, 255);
  triangle(0, 0, 100, -100, 200, 0);
}

void window() {
  fill(160, 168, 255);
  circle(100, 150, 100);
  fill(255, 60);
  circle(100, 150, 75);
}

void fire() {
  int y = 25;
  while(y <= 125) {
    fill(150);
    triangle(y, 300, y+50, 300, y+25, 340);
    y = y + 50;
  }
  
  int x = 0;
  while(x <= 150) {
    fill(0);
    triangle(x, 300, x+50, 300, x+25, 350);
    x = x + 50;
  }
}
