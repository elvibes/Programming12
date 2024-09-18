void intro() {
  soccerfield();
  fill(255);
  textSize(150);
  text("MINI SOCCER", 400, 100);
  
  textSize(50);
  text("PLAYER 1", 220, 240);
  text("PLAYER 2", 550, 240);
  
  textSize(30);
  text("Press W to move up", 220, 300);
  text("A to move left", 220, 330);
  text("S to move down", 220, 360);
  text("D to move right", 220, 390);
  
  text("Press UP ARROW to move up", 550, 300);
  text("LEFT ARROW to move left", 550, 330);
  text("DOWN ARROW to move down", 550, 360);
  text("RIGHT ARROW to move right", 550, 390);
  
  tactilebutton(400, 500, 120);
}

void tactilebutton(int x, int y, int d) {
  strokeWeight(10);
  if(dist(mouseX, mouseY, x, y) < d/2) {
    stroke(255);
    fill(0);
    circle(x, y, d);
    
    fill(255);
  } else {
    stroke(0);
    fill(255);
    circle(x, y, d);
    
    fill(0);
  }
  textSize(70);
  text("GO!", x, y);
}

void introClicks() {
  if(dist(mouseX, mouseY, 400, 500) < 60) {
    mode = GAME;
  }
}
