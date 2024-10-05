Gif imposter1, imposter2, greenmoon;

void setup() {
  size(800, 600);
  greenmoon = new Gif("green_moon/frame_", "_delay-0.11s.png", 20, 5, 0, 0, width, height);
  imposter1 = new Gif("imposter/frame_", "_delay-0.07s.gif", 10, 1, 390, 420, 75, 100);
  imposter2 = new Gif("imposter/frame_", "_delay-0.07s.gif", 10, 2, 100, 60, 125, 150);
}

void draw() {
  //show functions
  greenmoon.show();
  imposter1.show();
  imposter2.show();
}
