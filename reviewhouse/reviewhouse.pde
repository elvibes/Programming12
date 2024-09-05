//variables
float sunY;
boolean day;


//pallette
color orange = #f4a261;

void setup() {
  size(600, 600);
  background(126, 196, 255);
  
  //sun
  sunY = 250;
  day = true;
  
  
}

void draw() {
  strokeWeight(2);
  
  //sun
  sunY = sunY - 1;
  
  if(sunY < -50) {
    sunY = 600;
    day = !day;
  }
  
  
  if(day == true) {
    background(126, 196, 255);
    fill(255, 245, 157);
    circle(75, sunY, 100);
  } else {
    background(0);
    fill(255);
    circle(75, sunY, 100);
    fill(0);
    ellipse(50, sunY, 50, 100);
  }
  
  //ground
  strokeWeight(5);
  fill(149, 255, 178);
  rect(-50, 450, 700, 200);
  
  //walls
  fill(orange);
  rect(150, 300, 300, 200);
  
  //windows
  fill(178, 225, 255);
  circle(200, 400, 60);
  circle(400, 400, 60);
  
  //roof
  triangle(150, 300, 450, 300, 300, 200);
  
  //door
  fill(250, 178, 255);
  rect(250, 400, 100, 100);
  line(300, 400, 300, 500);
}
