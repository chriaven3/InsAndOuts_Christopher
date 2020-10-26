/* Christopher Avendano _ Short Study 2 ~ Reactions 

INSTRUCTIONS:  The circle in the center changes to the most dominant color of the backgrounds RGB value.

CLICK TO START/REVEAL SQUARES:
*The 4 floating squares each track the mouse position in different ways. 
*The 4 floating squares also play with color values on click in ways listed beside their code.

1: Click to grow the squares, after a set amount of clicks they shrink down smaller then they started as!
2: Clicking also randomizes soft colors, and changes the background [[which in turn changes the middle circle listed ^ by its condition]]


*/

float r= 255;      //declare RGB colors to be randomized, only works as floats?
float g= 255;   
float b= 255;

int size = 100;
                        //delay(1); is the wait() tool | && is AND


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //


void setup()   //On startup, run once
{
  size (700, 700);      //size of canvas
  rectMode(CENTER);    //helps squares line up to center screen
  

}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //



    void draw()           //Start Loop
{           

  background (r, g, b);            //Refresh background colors 
  
  stroke(255);                                  //Start square growth
  fill(g, b, r);  //bottom right                      Map Green to Red, Blue to Green, Red to Blue
  rect(mouseX, mouseX, size, size);                          //position determined by mouse horizontal value
  
  fill(b, r, g);   //top left                      Blue to Red, Red to Green, Green to Blue
  rect(mouseY, mouseY, size, size);                        //position determined by mouse vertical value
  
  fill(r, b, g);  //bottom left                  Regular
  rect(pmouseY, pmouseX, size, size);                      //position determined by inverted mouse point values
  
  fill(r+b+g, r+b+g, r+b+g);  //bottom right   Sum of all RBG values assigned to each R G B
  rect(pmouseX, pmouseY, size, size);                       //position determined by mouse point values

  stroke(0);
  strokeWeight(4);      //oh hell yeah 
  
  
  
  
  if ((r > b) && (r > g))  //Condition: if theres more RED than BLUE and more RED than GREEN
   
   { fill(255, 0, 0);                            
    ellipse (width/2, height/2, 100, 100); }
  
   
   else if ((g > b) && (g > r))  //If theres more GREEN than everything else
   { fill(0, 255, 0);                            
    ellipse (width/2, height/2, 100, 100); }
      
  
    else     //if all else fails; just make it blue
   { fill(0, 0, 255);
     ellipse (width/2, height/2, 100, 100); }
  
  
  
  if (size > 500)   //If squares get to big shrink em' back
  {
    size = -16;  
  }
  
    
} //LOOP END




void mousePressed()   //ON [MOUSE CLICK] DO
{
  r= random (0, 100);  // for R = generate random float between two numbers.
  g= random (0, 100);
  b= random (0, 100);
  
  size = size + 15;
  //print values to console
  println ("r: " + r);
  println ("g: " + g);
  println ("b: " + b);
  println (size);
}
