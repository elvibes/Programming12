class Gif {
  //instance variables
  float x, y, w, h;
  int numFrames, speed, currentFrame;
  PImage[] frames;

  //constructor
  Gif(String b, String a, int _numFrames, int _speed, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    frames = new PImage[_numFrames];
    numFrames = _numFrames;
    speed = _speed;
    currentFrame = 0;

    for (int i = 0; i < numFrames; i++) {
      frames[i] = loadImage(b + i + a);
    }
  }

  //behaviour functions
  void show() {
    if (currentFrame == numFrames) currentFrame = 0;
    image(frames[currentFrame], x, y, w, h);
    if (frameCount % speed == 0) currentFrame++;
  }
}
