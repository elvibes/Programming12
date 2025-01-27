void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);
      }
      
      if (c == grayblue) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, blackstone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, blackstone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, blackstone, gridSize);
      }
    }
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  int x = start;
  int z = start;
  while (z < end) {
    texturedCube(x, level, z, sand, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  fill(255, 0, 0);
  sphere(5);
  popMatrix();
}
