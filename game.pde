void game() {
 // background(0);
  
  //background pic
  image(bloody,0,0,1100,1000);
  //pause button
  pause(100,15);
  
  //home button
  home(40, 15);
  
  //restart button
  restart(160,15);
  //fill(150);
  //textFont(restart, 100);
  //textSize(45);
  //text("M", 175,70);
  //DO FONT
  
  //SCORE CODE ==========================================================================================================
  fill(255);
  textSize(30);
  text("Score: " + score, width/2, 50); //will say the work score + the value of the score
  text("Lives: " + lives, width/2, 20);


  //PADDLE CODE ==========================================================================================================
  
 // draw paddles
  noStroke();
  fill(108,99,94);
  circle(px, py, pd);
  
  //move paddles left & right
  if (akey == true) px= px-5;
  if (dkey == true) px= px+5;

  // paddle limits (dont leave screen)
  if (px< 0+ pd/2) { //limits is edge + radius
    px= 0+ pd/2;
  }
  if (px> width-pd/2) { //limits is edge - radius
    px= width-pd/2;
  }

  //timer
  timer = timer-1; //ticks down by 1 each frame

  //BALL CODE ==========================================================================================================

  //ball draw
   noStroke();
  fill(c, 10, 10);//random color of ball
  circle(bx, by, bd);

  //ball bounce & move
  if (timer<0) {
    bx= bx + vx; //for moving x-value
    by= by + vy; //for moving y-value
  }

  //ball bounce of the walls (x+y)
  if (by<bd/2 || by>height-bd/2) {//no matter what size circle, it will bouce off the edge (because of d/2 and width
    vy= vy* -1;
  }
  if (bx<bd/2 || bx>width-bd/2) {//no matter what size circle, it will bouce off the edge (because of d/2 and width
    vx= vx* -1;
  }

  //ball bounce on paddles
  if (dist(px, py, bx, by) <= pd/2 + bd/2) {
    vx= (bx - px)/20;
    vy= (by- py)/20;
    vx= vx * 1.1; //change speed
    vy= vy * 1.1;
  }

  //ball limits up and down (dont leave screen)
  if (by > height- bd/2) {
    by= height-bd/2;
    lives= lives-1;
  }
  if (by < 0 + bd/2) {
    by= 0 + bd/2;
  }

  //ball limits left and right (dont leave screen)
  if (bx > width- bd/2) {
    bx= width-bd/2;
  }
  if (bx < 0 + bd/2) {
    bx= 0 + bd/2;
  }

 if (score==n){
  mode= GAMEOVER;
 } 
 if (lives==0){
 mode=GAMEOVER;
 }
 
 //find a way out
 fill(255);
 textSize(40);
 text("FIND", 150,100);
 text ("YOUR", 400, 200);
 text ("WAY", 300, 300);
 text("OUT", 600, 450);
 
 
 //BRICK CODE==========================================================================================================
 //brick bouncing, and showing while loop
  int i=0;
  float r= 206; //color
  while (i<n) { // (i<# of arrays)
   r=r-1.5;//color jump 1
   stroke(0);
   fill(r, 10,10);
   strokeWeight(3);
   if (alive[i] == true){ //if the brick is alive, the brick will be show by manageBrick/ so if alive==false, manage brick will disappear
    manageBrick(i);
   }
    i++; //could also say i= i+1;
  }
}


void gameClicks() {
if (mouseX> 100 && mouseX< 150 && mouseY>15 && mouseY< 65){
  mode=PAUSE; //for pause button
  }
if (mouseX> 40 && mouseX< 90 && mouseY>15 && mouseY< 65){
  mode=INTRO; //for home button
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
if (mouseX> 160 && mouseX< 210 && mouseY>15 && mouseY< 65){
 //for restart button
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
}


void manageBrick(int i){ //just to make things more clear and organized
    rectMode(CENTER);
    square(x[i], y[i], brickd);
    if (dist(bx, by, x[i], y[i]) <= bd/2 + brickd/2) { //brick collision, works for as many bricks as you have
      vx= (bx - x[i])/5;
      vy= (by- y[i])/5;
      vx= vx * 1.1; //change speed
      vy= vy * 1.1;
      score= score+ 1;//score when you hit a brick
      alive[i]= false; // when ball hits brick, alive is false so brick will disappear
   
    } 
}

 //pause button
void pause(int x, int y){
  rectMode(CORNER);
  pushMatrix();
  translate(x,y);
  
  strokeWeight(3);
  //stroke(0);
  fill(100,5,5);
  tactile(x, y, 50, 50);
  rect(0, 0, 50, 50);//since its translate, make x,y 0 and change translate (up in draw)
  stroke(255);
  fill(255);
  rect(13,10, 5, 30);
  rect(30, 10, 5, 30);
  
  popMatrix();
}//================================================================================================


//home button
void home(int x, int y){
  rectMode(CORNER);
  pushMatrix();
  translate(x,y);
  
 strokeWeight(3);
 fill(100,5,5);
  tactile(x, y, 50, 50);
  rect(0, 0, 50, 50); //60,20
  stroke(255);
  fill(255);
  rect(10, 20, 30, 20);
  triangle(12, 18, 38, 18, 25, 7);
 
  popMatrix();
}//================================================================================================
  

//restart button
void restart(int x, int y){
 rectMode(CORNER);
  pushMatrix();
  translate(x,y);
  
 strokeWeight(3);
  stroke(0);
 fill(100,5,5);
  tactile(x, y, 50, 50);
  rect(0,0, 50, 50); //150,50,
  
 
  
  popMatrix();
}//================================================================================================


//void paddle (int x, int y){
//  pushMatrix();
//  translate(x,y);
  
//   //draw paddles
//  noStroke();
//  fill(108,99,94);
//  circle(px, py, pd);
  
//  //knives
//  triangle();
  
  
//  popMatrix();
  
  
//}
//NOTE 
 //BRICK CODE==========================================================================================================
  //long way, write to many bricks, and too many line, (brick draw)
  //circle(x[0], y[0], brickd); //size of circle on page 0
  //circle(x[1], y[1], brickd); //size of circle on page 0
  //circle(x[2], y[2], brickd); //size of circle on page 0
//instead we can write a while loop, i means that whatever page you put in setup

//notes on mode framework
 //x[0] = 100; //on page 0 (which is page 1), the bricks x and y variable will be 100
  //y[0] = 100;
  
  //x[1]= 400; //on page 1 (which is page 2), the brick x will be 400 and y will be 100
  //y[1]= 100;
  
  //x[2]= 700;//on page 2 (which is page 3), the brick x will be 700 and y will be 700
  //y[2]= 100;
  
  //x[3]= 100;//on page 2 (which is page 3), the brick x will be 700 and y will be 700
  //y[3]= 200;
  
  
