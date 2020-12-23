/* Christopher Avendano _ Short Study 3 ~ Patterns
 
 Controls: Spacebar to restart at any time
 Click on the on either side of the screen to strafe in that direction
 C
 */

import processing.serial.*; //imports Serial library from Processing

float bevel = 20;
float direction = 0.5;

int size = 50;
int handArc = 600;
int steps = 500;       //TRACKS AMOUNT OF MOVEMENTS/CLICK INPUTS  [INPUT]

boolean isRaining = false;   //Activates Rain ForLoop effect when enabled        [EFFECTS]*
boolean gameOver = false;   //Activates game over effect when enabled            Game over bool      *

boolean bgRefresh = true;  //Refreshes Background
boolean drivForward = false;   //Moving Forward [INPUT]
boolean drivLeft = false;     //Moving Left  [INPUT]
boolean drivRight = false;   //Moving Right [INPUT]
//Array to link tree positions to amount of steps/clicks of the mouse
//10                                         //20                                       //30
int treeLX[] = {300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 

  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, //40 in top row, 30 per other row  
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, // every segment 100
  300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 300, 200, 100, 50, 0, 0};                      //100 total positions to match steps LEFT SIDE X

//END OF TREES LEFT SIDE, TOTAL 1001

int treeRX[] = {400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 

  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 
  400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 400, 500, 600, 650, 700, 700};  //100 total positions each segment to match steps RIGHT SIDE X
  
  //END OF TREES RIGHT SIDE, TOTAL 1001

int treeY[] = {0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 

0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500,  //40 top line, 30 in others
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 
  0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 0, 150, 250, 400, 500, 500};               //100 total positions each segment to match steps Y VALUE
  
  //1001 total, end of Y axis tree data

//notes** delay(1); is the wait() tool | && is AND | ((g > b) && (g > r))  <--- MULTICONDITION LAYOUT IN IF CONDITIONS |



//Arduino setup

Serial myPort; // creates object from Serial class
int val = 0; // creates variable for data coming from serial port
int POTval=0;
int BUTTONval= 0;

float handX = 0;



//Windshield wiper


float clockwiseSlow;
float countClockwiseSlow;

boolean winActivate = false;
boolean win1_vis = false;
boolean alt1_vis = false;

boolean pedalDebounce = true;
boolean clickisactive = true;

int win1_Opac = 255;
int alt1_Opac = 0;

int invisible = 0;
int visible = 255;
int dir = 1;
int swapCount = 0;

long lastTime = 0;
long lastTime2 = 0;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //


void setup()   //On startup, run once
{
  size (700, 700);      //size of canvas
  rectMode(CENTER);    //helps squares line up to center screen

  lastTime = millis();
  lastTime2 = millis();   //two timers


  //arduino port setup vvv

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //



void draw()           //Start Loop
{           
  if (bgRefresh == true) {
    background (0, 0, 0);            //Refresh background colors
  }

  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }


  if (val == 0 || val == 1) {
    BUTTONval = val;
  } else {
    POTval = val;
  }

  //println ("val: " + val); //prints to Processing console
  //println ("POTval: " + POTval);
  println ("BUTTONval: " + BUTTONval);
  println ("pedalDebounce: " + pedalDebounce);
  println ("steps: " + steps);
  println ("clickisactive: " + clickisactive);
  println ("game over: " + gameOver);

  //windshield wiper
  if (isRaining == false) {
    winDeactivate();
  }

  if (winActivate == true) {
    spinRight();
  }

  if (winActivate == true) {
    if (dir == 1) {
      spinLeft();
    } else if (dir == 2)
    {
      spinRight();
    }
  }

  //Timer thank you/credit to user A__G at https://forum.processing.org/one/topic/create-a-delay.html, heavily modified but wanted to credit research
  if (( millis() - lastTime > 200 )&&(swapCount < 4)) {           //Timer 1   Constant switches of DIR for left and right timing
    // println( "do things every 2.5 seconds" );   
    if (winActivate == true) {
      dir = 1;
      swapCount = swapCount + 1;
    }
    lastTime = millis();
  }


  if ( millis() - lastTime2 > lastTime - 100 ) {            //Timer 2   Constant switches of DIR for left and right timing
    //  println( "do things every 2.5 seconds" );

    if ((winActivate == true)&&(swapCount >= 4)) {
      dir = 2;
      swapCount = swapCount + 1;
      if (swapCount >= 7) {
        swapCount = 0;
      }
      lastTime2 = millis();
    }
  }


  //  println(dir);
  // println (lastTime);
  // println (lastTime2);


  //Rotation Directions and speed controls
  clockwiseSlow += 0.05;
  countClockwiseSlow -= 0.05;

  //println(clockwiseSlow);  //find good interval to swap visibility
  //

  // ======================================================== Visibility BOOLS Windshield  V V V V

  if (win1_vis == true) {  
    win1_Opac = visible;
  } else if (win1_vis == false) {
    win1_Opac = invisible;
  }


  if (alt1_vis == true) {  
    alt1_Opac = visible;
  } else if (alt1_vis == false) {
    alt1_Opac = invisible;
  }



  // ======================================================== ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^



  drivForward = false; 
  drivLeft = false; 
  drivRight = false; 

  if (gameOver == false) {

    fill(0, 200, 0);                                            //TREES
    ellipse(treeLX[steps], treeY[steps], 50, 50);                    //tree left generator
    ellipse(treeRX[steps], treeY[steps], 50, 50);                    //tree right generator
    fill(255);

    quad(0, 700, width*direction, height/2, width*direction, height/2, 700, 700);                  //ROAD

    fill(255, 100, 100);  
    rect(width*direction, height/2, size/20, size/20, bevel);           //House in distance [increase per step]  

    fill(100, 200, 200);
    textSize(40);
    text("GOAL", width*direction, height/2);

    rotateAboutEllipseCenter();    //Runs the function that animates the elipses   Placement here to get infront of Road Drawings

    if (isRaining == true) {            //RAIN MODULE START
      for (int x=0; x<=width; x+=10) {      
        fill(0, 150, 255);
        ellipse (x, random(0, 700), 5, 5);
        fill(255);
      }
      spinLeft();
    }                                   //RAIN MODULE END



    //*INTERIOR CAR PARTS*
    stroke(255, 204, 0);                                     //Whip color
    fill(255, 204, 0);
    triangle(-10, 700, -10, -10, 125, -10);               //Interior Boarder LeftSide
    triangle(710, 700, 710, -10, 575, -10);              //Interior Boarder RightSide
    rect(width*0.5, height*0.08, 710, 130, 10);         // CAR HOOD
    rect(width*0.5, height*0.9, 710, 200, 10);         // DASHBOARD 

    handX = map(POTval + 0.1, 2.0, 255.0, 0.0, 700.0);             //Map Arduino POT

    stroke(0);
    fill(200, 200, 200);
    ellipse(width/2, 650, 300, 300);                    //Steering wheel

    fill(200, 175, 150);
    ellipse(handX, handArc, 125, 75);                 //Steering wheel hand 1
    fill(255); //reset color to white

    if ((handX > 0) && (handX < width*0.33))
    {
      //println("Left Side");   //Hand on left side
      handArc = 600;
      drivLeft = true;
    } else if ((handX > width*0.66) && (handX < width))    //Hand on left side
    {
      // println("Right Side");
      handArc = 600;
      drivRight = true;
    } else //if (handX == width)        //Hand in middle/Anywhere else
    {
      //println("Center");
      handArc = 525;
      drivForward = true;
    }

    if (clickisactive == true)
    {
      if ((BUTTONval == 1 && pedalDebounce == true)) {
        pedalDebounce = false;
        delay(25);                                                                                    //SPEED OF CAR
        mousePressed();
        delay(25);
        pedalDebounce = true;
      }
    }

    //START RAINING AFTER STEP 40 (40 Clicks)
    if (steps >= 450) {
      isRaining = true;
    }


    if (steps == 500) {                                          //winshield activate after 12 steps
      winActivate = true;
    }
    if (steps > 1000) {
      steps = 1000;
      pedalDebounce = false;
      clickisactive = false;
      delay(1);
      gameOver = true;
      delay(1);
    }


    if (gameOver == true) {                                        //Game over screen

      bgRefresh = false;
      delay(1);
      background (0, 0, 0);
      //*INTERIOR CAR PARTS*
      stroke(255, 204, 0);                    //Whip color
      fill(255, 204, 0);
      triangle(-10, 700, -10, -10, 125, -10);              //Interior Boarder LeftSide
      triangle(710, 700, 710, -10, 575, -10);              //Interior Boarder RightSide
      rect(width*0.5, height*0.08, 710, 130, 10);         // CAR HOOD
      rect(width*0.5, height*0.9, 710, 200, 10);         // DASHBOARD 



      size = 50;
      isRaining = false;
      winDeactivate();
      textSize(32);

      text("Welcome Home!!", width*0.3, height/2); 
      textSize(16);
      text("Press spacebar to restart", 265, 500);
    }
  }
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ON CLICK BELOW


void mousePressed()   //ON [Button CLICK] DO

  /// WHEN USER CLICKS, DRIVE IN DIRECTION
{


  bevel = bevel - 0.001;   //Rocks roundness
  size = size + 5 + steps/100;    //Speed of Rock



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
    bevel = 20;

    isRaining = false;

    println("Restarted");
    gameOver = false;

    background (0, 0, 0);
    bgRefresh = true;
    pedalDebounce = true;
    clickisactive = true;
  }
}


void rotateAboutEllipseCenter() {

  pushMatrix();   //Something built into processing that allows for the translation of parts? Not fully understood but hey it works and can be modded ez pz!

  fill(255, 0, 0, win1_Opac);  //WIN 1 - COlOR/TRANSPARENCY *    [Windshield 1 Properties]
  strokeWeight(2);                                 // * 
  stroke(0, 0, 0, win1_Opac);                              // *

  // Windshield 1 Physics
  pushMatrix();
  translate(350, 560);   //Coordinates of the Ellipse
  rotate(clockwiseSlow);          //Rotate using the defined angle things (clockwiseSlow += 0.01;) at the top
  ellipse (0, 0, 705, 45);      //Create the Ellipse
  popMatrix();


  //*        [AltWin 1 Propteries] 
  fill(255, 0, 0, alt1_Opac);  //WIN 1 ALT - COLOR/TRANSPARENCY (last property is opacity) can use that as a var to easy hide and show   
  stroke(0, 0, 0, alt1_Opac);     // * opacity on stroke hides outline :D

  // Windshield 1 ALT Physics

  pushMatrix();
  translate(350, 560);   //Coordinates of the Ellipse
  rotate(countClockwiseSlow);          //Rotate using the defined angle things (clockwiseSlow += 0.01;) at the top
  ellipse (0, 0, 705, 45);      //Create the Ellipse
  popMatrix();


  popMatrix();                //Two of these at the end or error
}

void spinLeft() {
  alt1_vis = true;
  win1_vis = false;
}

void spinRight() {
  alt1_vis = false;
  win1_vis = true;
}


void winDeactivate()
{
  alt1_vis = false;
  win1_vis = false;
}
