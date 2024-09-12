void pattern1() {
  background(255);
  stroke(1);

  int x = 50, y = 0;

  while (y <= 750) {
    fill(64, 171, 255, 25);
    circle(x, y, 100);
    x = x + 100;
    fill(146, 64, 255, 25);
    circle(x, y, 100);
    x = x + 100;
    if (x == 850) {
      x = 50;
      y = y + 50;
    }
  }
}

void p1Clicks() {
  if (dist(mouseX, mouseY, 720, 300) < 30) {
    mode = PATTERN2;
  }

  if (dist(mouseX, mouseY, 80, 300) < 30) {
    mode = PATTERN3;
  }
}
