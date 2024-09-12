void pattern3() {
  background(100);
}

void p3Clicks() {
  if(dist(mouseX, mouseY, 720, 300) < 30) {
    mode = PATTERN1;
  }
  
  if(dist(mouseX, mouseY, 80, 300) < 30) {
    mode = PATTERN2;
  }
}
