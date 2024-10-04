class Gif {
  //instance variables
  int x, y, w, h;
  int numFrames, speed;
  String before, after;
  
  //constructor
  Gif(String b, String a, int _numFrames, int _speed, int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = _numFrames;
    speed = _speed;
    before = b;
    after = a;
  }
  
  //behaviour functions
  void show() {
    
  }
}
