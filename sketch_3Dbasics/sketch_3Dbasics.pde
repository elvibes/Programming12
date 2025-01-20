float rotx, roty;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(255);
  
  ball(width/2, height/2, 0, #FF0000, 100);
  //cube(width/2, height/2, 0, #FF0000, 200);
  cube(100, 100, 0, #0000FF, 100);
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); 
 
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  fill(c);
  stroke(0);
  strokeWeight(3);
  box(size); //side length
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); 
 
  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  fill(c);
  strokeWeight(3);
  stroke(c);
  sphere(size);
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
