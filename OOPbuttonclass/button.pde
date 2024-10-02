class Button {

  //instance variables
  int x, y, w, h; //x, y is the center
  boolean clicked;
  color highlight, normal;
  String text;

  //constructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
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
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(w/4);
    text(text, x, y);
  }
}
