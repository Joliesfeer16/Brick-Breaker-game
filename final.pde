void gameover(){

  if (score==n){
  //Gif 3
  image(gif3[g], 0, 0, width, height);
  g= g+1;
  if (g== numberOfFramez) g=0; 
  textFont(win,100); 
  fill(232,192,28);
  textSize(200);
  text("YOU ESCAPED", width/2, 400);
}

if (lives==0){
//Gif 2
  image(gif2[o], 0, 0, width, height);
  o= o+1;
  if (o== numberOfFrames) o=0; 
  textFont(intro, 100);
  fill(180,7,7);
  textSize(100);
  text("YOU LOST", width/2, 100);
  }
}

void gameoverClicks(){
  mode=INTRO;
   bx= width/2;
  by= height-200;
  px= width/2;
  py= height;
  vx= random(-5,5);
  vy= random(-5,5);
  c= random(90,180);
  score= 0;
  lives= 3;
  int i = 0;
  while (i < n){
    alive [i] = true;
    i ++;
  }
}
