int mode;
final int PATTERN1 = 1;
final int PATTERN2 = 2;
final int PATTERN3 = 3;

void setup() {
  size(800, 600);
  mode = PATTERN1; 
  
}

void draw() {
  
  
  if (mode == PATTERN1) {
  pattern1();
  } else if (mode == PATTERN2) {
  pattern2();
  } else if (mode == PATTERN3) {
  pattern3();
  }
  
  tactilebutton(80, 300, 60);
  fill(0);
  triangle(90, 290, 70, 300, 90, 310);
  
  tactilebutton(720, 300, 60);
  fill(0);
  triangle(710, 290, 730, 300, 710, 310);
  
}

void tactilebutton(int x, int y, int d) {
  if(dist(mouseX, mouseY, x, y) < d/2) {
    fill(200);
    
  } else {
    fill(255);
  }
  circle(x, y, d);
}
