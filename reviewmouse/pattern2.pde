boolean cubeOn;

void pattern2() {
  background(255);
  noStroke();

  cubeOn = false;
  int x = -10, y = -5;
 
  while (y <= 800) {
    fill(255, 139, 139);
    quad(x, y, x + 40, y + 10, x + 40, y + 60, x, y + 50);
    fill(49, 51, 131);
    quad(x + 40, y + 10, x + 40, y + 60, x + 80, y + 50, x + 80, y);
    x = x + 80;
    if (x >= 870) {
      y = y + 60;
      if (cubeOn == true) {
        x = -10;
      } 
      if (cubeOn == false) {
        x = -50;
      }
     cubeOn = !cubeOn;
    }
  }
}

void p2Clicks() {
  if (dist(mouseX, mouseY, 720, 300) < 30) {
    mode = PATTERN3;
  }

  if (dist(mouseX, mouseY, 80, 300) < 30) {
    mode = PATTERN1;
  }
}
