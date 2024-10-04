color green = #006d77;
color brown = #e29578;
color pink = #f72585;
color blue = #4cc9f0;

boolean mouseReleased;
boolean wasPressed;

color bkg;

PImage buttonPic;

//Button blackButton, blueButton, greenButton, pinkButton;
Button[] myButtons;

void setup() {
  size(800, 800);
  bkg = 255;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  buttonPic = loadImage("apple.png");
  
  myButtons = new Button[4];
  myButtons[0] = new Button(buttonPic, 550, 300, 300, 300, 0, 255);
  myButtons[1] = new Button("BLUE", 200, 150, 200, 200, blue, pink);
  myButtons[2] = new Button("GREEN", 200, 400, 200, 200, green, brown);
  myButtons[3] = new Button("PINK", 400, 650, 600, 200, pink, blue);
  
}

void draw() {
  click();
  background(bkg);
  for (int i = 0; i < 4; i++) {
    myButtons[i].show();
    if (myButtons[i].clicked) {
      bkg = myButtons[i].normal;
    }
  }
}
