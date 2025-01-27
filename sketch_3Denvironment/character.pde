void controlCamera() {
  if (wkey && canMoveForward() && canMoveForwardLeft()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey && canMoveBackward()) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey && canMoveLeft()) {
    eyeX = eyeX - cos(leftRightHeadAngle + PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyeX = eyeX - cos(leftRightHeadAngle - PI/2)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle - PI/2)*10;
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX)*0.01;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY)*0.01;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
  
  if (spacekey) {
    objects.add(new Bullet());
  }

  println(eyeX, eyeY, eyeZ);
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float rightx, righty, rightz;
  int mapx, mapy;

  fwdx = eyeX + cos(leftRightHeadAngle)*200;
  fwdy = eyeY;
  fwdz = eyeZ + sin(leftRightHeadAngle)*200;

  rightx = eyeX + cos(leftRightHeadAngle - radians(20))*200;
  righty = eyeY;
  rightz = eyeZ + sin(leftRightHeadAngle - radians(20))*200;


  mapx = int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;


  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveForwardLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;

  leftx = eyeX + cos(leftRightHeadAngle + radians(20))*200;
  lefty = eyeY;
  leftz = eyeZ + sin(leftRightHeadAngle + radians(20))*200;

  mapx = int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;
  
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;

  leftx = eyeX + cos(leftRightHeadAngle - radians(90))*200;
  lefty = eyeY;
  leftz = eyeZ + sin(leftRightHeadAngle - radians(90))*200;

  mapx = int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;

  rightx = eyeX + cos(leftRightHeadAngle + radians(90))*200;
  righty = eyeY;
  rightz = eyeZ + sin(leftRightHeadAngle + radians(90))*200;

  mapx = int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward() {
  float bwdx, bwdy, bwdz;
  int mapx, mapy;

  bwdx = eyeX + cos(leftRightHeadAngle - radians(180))*200;
  bwdy = eyeY;
  bwdz = eyeZ + sin(leftRightHeadAngle - radians(180))*200;

  mapx = int(bwdx+2000)/gridSize;
  mapy = int(bwdz+2000)/gridSize;



  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
