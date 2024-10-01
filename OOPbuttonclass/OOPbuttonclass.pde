color green = #006d77;
color brown = #e29578;
color pink = #f72585;
color blue = #4cc9f0;

Button blackButton, blueButton, greenButton, pinkButton;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  blackButton = new Button("BLACK", 600, 200, 300, 300, 0, 255);
  blueButton = new Button("BLUE", 200, 150, 200, 200, blue, pink);
  greenButton = new Button("GREEN", 200, 400, 200, 200, green, brown);
  pinkButton = new Button("PINK", 400, 650, 600, 200, pink, blue);
  
}

void draw() {
  background(255);
  blackButton.show();
  blueButton.show();
  greenButton.show();
  pinkButton.show();
}
