void mouseReleased() {
  if (mode ==INTRO) {
   introClicks();
  } else if (mode == GAME){
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode== GAMEOVER){
    gameoverClicks();
  } else if (mode== OPTION){
    optionClicks();
  } 
}//================================================================================================

void tactile(int x, int y, int w, int h){
  if (mouseX> x && mouseX< x+w && mouseY> y && mouseY< y+h){
   stroke(255);
  } else {
    stroke(0);
  } 
}//================================================================================================
