/* Christopher Avendano _ Short Study 3 ~ Patterns
 
 Controls: Spacebar to restart at any time
           Click on the on either side of the screen to strafe in that direction
           C
 
 */




//float r = (0);
float bevel = 20;
float direction = 0.5;

int size = 50;
int handArc = 600;
int steps = 0;       //TRACKS AMOUNT OF MOVEMENTS/CLICK INPUTS  [INPUT]

boolean isRaining = false;   //Activates Rain ForLoop effect when enabled        [EFFECTS]*
boolean gameOver = false;   //Activates game over effect when enabled            Game over bool      *

boolean bgRefresh = true;  //Refreshes Background
boolean drivForward = false;   //Moving Forward [INPUT]
boolean drivLeft = false;     //Moving Left  [INPUT]
boolean drivRight = false;   //Moving Right [INPUT]
//Array to link tree positions to amount of steps/clicks of the mouse
//10                                         //20                                       //30
int treeLX[] = {300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 0};                      //31 total positions to match steps LEFT SIDE X
int treeRX[] = {400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 700};  //31 total positions to match steps RIGHT SIDE X

int treeY[] = {0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 500};               //31 total positions to match steps Y VALUE

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

  if (gameOver == false) {

    fill(0, 200, 0);                                            //TREES
    ellipse(treeLX[steps], treeY[steps], 50, 50);                    //tree left generator
    ellipse(treeRX[steps], treeY[steps], 50, 50);                    //tree right generator
    fill(255);

    quad(0,700, width*direction, height/2,width*direction, height/2, 700, 700);                  //ROAD

    fill(255, 100, 100);  
    rect(width*direction, height/2, size, size, bevel);           //House in distance [increase per step]  
    //triangle(width/2, (height*0.31)/size, width, height, width*0.1, height*0.1);  //Roof attempt completely wrong//find the right math? Maybe needs a var?
    
    
    //fill(60,150,200);
    //rect((width*direction)-25, (height/2)-20, size/4, size/4);       //window left  [[Math/logic is a bit difficult to think of. Very flimsey here]]
    //rect((width*direction)+25, (height/2)-20, size/4, size/4);       //window left  [[Math/logic is a bit difficult to think of. Very flimsey here]]
    
    fill(100,200,200);
    textSize(40);
    text("GOAL",width*direction, height/2);



    if (isRaining == true) {            //RAIN MODULE START
      for (int x=0; x<=width; x+=10) {      
        fill(0, 150, 255);
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
    fill(200, 200, 200);
    ellipse(width/2, 650, 300, 300);                    //Steering wheel

    fill(200, 175, 150);
    ellipse(pmouseX, handArc, 125, 75);                 //Steering wheel hand 1
    fill(255); //reset color to white

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

  if (steps >= 30) {
    gameOver = true;
  }


  if (gameOver == true) {                                        //Game over screen


    //*INTERIOR CAR PARTS*
    stroke(255, 204, 0);                    //Whip color
    fill(255, 204, 0);
    triangle(-10, 700, -10, -10, 125, -10);              //Interior Boarder LeftSide
    triangle(710, 700, 710, -10, 575, -10);              //Interior Boarder RightSide
    rect(width*0.5, height*0.08, 710, 130, 10);         // CAR HOOD
    rect(width*0.5, height*0.9, 710, 200, 10);         // DASHBOARD 



    size = 50;
    isRaining = false;
    textSize(32);

    text("Welcome Home!!", width*0.3, height/2); 
    textSize(16);
    text("Press spacebar to restart", 265, 500);
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
    direction = 0.7;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  } else if (drivRight == true) {       //Step to the Right
    println("1 Step Right");
    direction = 0.3;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  } else if (drivForward == true) {       //Step Neutral
    println("1 Step Forward");
    direction = 0.5;

    steps = steps + 1;
    println("TotalSteps = " + steps);
  }


  if (gameOver == true) {          //Click anywhere after a game over.

    steps = 0;
    println("TotalSteps = " + steps);
    delay(1);
  }
}

void keyPressed() {
  if (key == ' ') {
    steps = 0;
    size = 50;
    isRaining = false;

    println("Restarted");
    gameOver = false;
  }
}
