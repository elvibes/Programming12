void intro() {
  fill(#3BFF49);
  textSize(100);
  text("THE GOLF GAME", width/2, height/2 - 30);
  textSize(30);
  text("Objective: Finish 3 hole course in 5 strokes", width/2, height/2 + 50);
  
  score = 0;
}

void introClicks() {
  mode = LEVEL1;
}
