
//brick breaker game
//restart button, win/lost text, fix speed of ball, submit

//GIF
PImage[] gif1;
int numberOfFrame;
int f;

//GIF
PImage[] gif2;
int numberOfFrames;
int o;

PImage[] gif3;
int numberOfFramez;
int g;

//Brick variables
int []x; //array for x
int []y; //array for y
int brickd; //size of bricks
int n;
int tempx, tempy;
boolean [] alive; //boolean is for true and false


//mode variables
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;
final int OPTION    = 5;

 //font
 PFont  intro;
 PFont  start;
 PFont  win;
 PFont  restart;
 


//images
PImage bloody;
 
//score variable
int score;
int lives;
int highscore;

//intro GUI
float a;

//game entities
float bx, by, bd, vx, vy, px, py, pd;

//keyboard variables
boolean akey, dkey;

//keyboard variables
boolean wkey, skey, upkey, downkey; //when it's true, they key will be pressed
boolean AI;

//scoring
int timer;

//color random
float c= random(90,180);

//float r;

void setup(){
  size(950,750);
  textAlign(CENTER, CENTER);
  
  intro= createFont("BLOODY.TTF", 40);
  start= createFont("JMH Typewriter-Bold.ttf", 40);
  win= createFont("Sunrise Heaven.otf",40);
  restart= createFont("Font 90 Icons.ttf", 40);
  
 //image 
 bloody= loadImage("bloodypic.jpeg");
 
 //GIF 1
  numberOfFrame= 15;
 gif1= new PImage [numberOfFrame];
 
 int t=0;
 while (t< numberOfFrame){
   gif1[t] = loadImage("frame_"+t+"_delay-0.1s.gif");
   t++;
 }
 
  //GIF 2
  numberOfFrames= 73;
 gif2= new PImage [numberOfFrames];
 
 int j=0;
 while (j< numberOfFrames){
   gif2[j] = loadImage("frame_"+j+"_delay-0.03s.gif");
   j++;
 }
 
 //GIF 3
 numberOfFramez = 160;
 gif3= new PImage [numberOfFramez];
 
 int v=0;
 String zero1 = "0";
 String zero2 = "0";
 while (v< numberOfFramez){
   gif3[v] = loadImage("frame_"+zero1+zero2+v+"_delay-0.05s.gif");
   //frame_142_delay-0.05s.gif add zeros back 
   v++;
   if (v == 10) zero2 = "";
   if (v == 100) zero1 = "";
 }
  noStroke();
  mode= INTRO;
  
  //set up paddle and ball
  bx= width/2;
  by= height-200; //fix
  bd= 30;
  px= width/2;
  py= height;
  pd= 200;
  vx= random(5,10);
  vy= random(5,10);

  //score
  score= 0;
  lives= 3;

  
  //set up bricks 
  brickd= 50; //diameter of bricks
  n=128; //# of arrays
  x= new int[n];  //for arrays, you must tell how many arrays you want per book, so [# of briks]
  y= new int[n];
  tempx= 100; //where we start the bricks x value
  tempy= 100; //where we start the bricks y value
  alive= new boolean[n]; 
  
  //brick layout
  int i= 0;
  while (i < n){
   x[i]= tempx;
   y[i]= tempy;
   alive[i] = true; //each individual brick is alive
   tempx= tempx+ 50; //distance between each brick
   if (tempx == width-50){ //== is for comparing (this is so that when it reaches end of screen, it starts on the line below)
     tempy= tempy+50; //jumps a line of 100  below
     tempx= 100; // gap from the screen 
   }
    i=i+1;
  } 
}
  
void draw(){
  if (mode==INTRO){
      intro();
  }else if(mode== GAME){
    game();
  }else if (mode== PAUSE){
    pause();
  }else if (mode== GAMEOVER){
    gameover();
  } else if (mode==OPTION) {
    option(); 
  } else{
    println("MODE ERROR in draw:" + mode);
  }  
} 
