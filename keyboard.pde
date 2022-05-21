void keyPressed(){
  if (key== 'a' || key == 'A') akey= true;
  if (key== 'd' || key == 'D') dkey= true;
}

void keyReleased(){
  //when you let go of the key, the function will be false/ will stop working 
  if (key== 'a' || key == 'A') akey= false;
  if (key== 'd' || key == 'D') dkey= false;
}
