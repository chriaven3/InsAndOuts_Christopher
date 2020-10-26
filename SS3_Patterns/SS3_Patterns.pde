/* Christopher Avendano _ Short Study 3 ~ Patterns
 
 One conditional statement  CHECK
 two FOR loops that create a pattern
 one rollover response    CHECK
 attention to concept & visual detail  CHECK
 instructions 
 
 
 DRIVE CAR, AVOID A CRASH
 
 MAKE BIG CIRCLE WHEEL ON BOTTOM
 
 */



float r = (0);
float bevel = 20;
float direction = 0.5;

int size = 50;
int handArc = 600;
int steps = 0;       //TRACKS AMOUNT OF MOVEMENTS/CLICK INPUTS  [INPUT]

boolean isRaining = false;   //Activates Rain ForLoop effect when enabled        [EFFECTS]*
boolean gameOver = false;   //Activates game over effect when enabled                     *

boolean bgRefresh = true;  //Refreshes Background
boolean drivForward = false;   //Moving Forward [INPUT]
boolean drivLeft = false;     //Moving Left  [INPUT]
boolean drivRight = false;   //Moving Right [INPUT]


//notes** delay(1); is the wait() tool | && is AND | ((g > b) && (g > r))  <--- MULTICONDITION LAYOUT IN IF CONDITIONS |

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //


void setup()   //On startup, run once
{
  size (700, 700);      //size of canvas
  rectMode(CENTER);    //helps squares line up to center screen
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //



void draw()           //Start Loop
{           

  if (bgRefresh == true) {
    background (0, 0, 0);            //Refresh background colors
  }

  drivForward = false; 
  drivLeft = false; 
  drivRight = false; 


  fill(255, 255, 255);  
  rect(width*direction, height/2, size, size, bevel);           //PATH                  [[WIN/LOSE CONDITION FACTOR]]  *moved by direction variable*



  if (isRaining == true) {            //RAIN MODULE START
    for (int x=0; x<=width; x+=10) {      
      fill(0,150,255);
      ellipse (x, random(0, 700), 5, 5);
      fill(255);
    }
  }                                   //RAIN MODULE END



                                                                        //*INTERIOR CAR PARTS*
  stroke(255, 204, 0);                    //Whip color
  fill(255, 204, 0);
  triangle(-10, 700, -10, -10, 125, -10);              //Interior Boarder LeftSide
  triangle(710, 700, 710, -10, 575, -10);              //Interior Boarder RightSide
  rect(width*0.5, height*0.08, 710, 130, 10);         // CAR HOOD
  rect(width*0.5, height*0.9, 710, 200, 10);         // DASHBOARD 
  stroke(0);
  fill(255);
  
  ellipse(width/2, 650, 300, 300);                    //Steering wheel
  
  ellipse(pmouseX, handArc, 125, 75);                 //Steering wheel hand 1



  if ((mouseX > 0) && (mouseX < width*0.33))
  {
    //println("Left Side");   //Hand on left side
    handArc = 600;
    drivLeft = true;
  } else if ((mouseX > width*0.66) && (mouseX < width))    //Hand on left side
  {
    // println("Right Side");
    handArc = 600;
    drivRight = true;
  } else //if (mouseX == width)        //Hand in middle/Anywhere else
  {
    //println("Center");
    handArc = 525;
    drivForward = true;
  }






  //START RAINING AFTER STEP 20 (20 Clicks)
  if (steps >= 10) {
    isRaining = true;
  }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ON CLICK BELOW


void mousePressed()   //ON [MOUSE CLICK] DO


  /// WHEN USER CLICKS, DRIVE IN DIRECTION
{

  // println("Forward "+ drivForward);            Enable these to see direction in output * 
  // println("Left "+ drivLeft);                                                          *
  // println("Right "+ drivRight);                                                        *


  bevel = bevel - 0.1;   //Rocks roundness
  size = size + 10;    //Speed of Rock



  if (drivLeft == true) {             //Step to the left
    println("1 Step Left");
    direction = 0.3;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  } else if (drivRight == true) {       //Step to the Right
    println("1 Step Right");
    direction = 0.7;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  } else if (drivForward == true) {       //Step Neutral
    println("1 Step Forward");
    direction = 0.5;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  }
}
