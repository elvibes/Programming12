class Button {

  //instance variables
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;



  //constructor
  Button(boolean g, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    gravity = g;
  }

  Button(int _x, int _y, int _w, int _h, color norm, color high, boolean e) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    newElement = e;
  }

  //Behaviour functions
  void show() {
    drawButton();
    drawLabel();

    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }

    if (gravity == true) {
      world.setGravity(0, 900);
    } else {
      world.setGravity(0, 0);
    }

    if (newElement == true) {
      if (frameCount % 20 == 0) {  //Every 20 frames ...
        makeCircle();
        makeBlob();
        makeBox();
        makeBird();
      }
    } 
  }

  boolean touchingMouse() {
    //return true if mouse is touching button
    return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
  }

  void drawButton() {
    //rectangle
    if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30); //rounded corners
  }

  void drawLabel() {
    //text label
    textSize(w-50);
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    text("ON", x, y);
  }
}
