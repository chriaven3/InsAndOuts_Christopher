float clockwiseSlow;
float countClockwiseSlow;
float clockwiseFast;
float countClockwiseFast;

boolean win1_vis = true;
boolean alt1_vis = false;

int win1_Opac = 255;
int alt1_Opac = 0;

int invisible = 0;
int visible = 255;


void setup() {
  size(640, 640);
}

void draw () {
  background(255);
  // Use the centre of the screen as the origin [0,0]
  translate(width/2, height/2);
  strokeWeight(2);
  


  rotateAboutEllipseCenter();    //Runs the function that animates the elipses

  // ========================================================
                                                                    //Rotation Directions and speed controls
  clockwiseSlow += 0.01;
  countClockwiseSlow -= 0.01;
  clockwiseFast += 0.127;
  countClockwiseFast -= 0.127;                                    //rotate wiper until certain interval, then switch it to run the counterClockwise varient. Either that or make one transparent and a hidden one visible.


  println(clockwiseSlow);  //find good interval to swap visibility
  
  
  
  
   // ======================================================== Visibility BOOLS  V V V V
  
  if (win1_vis == true){  
  win1_Opac = visible;
  }
  
  else if (win1_vis == false){
  win1_Opac = invisible;
  }
  
  
    if (alt1_vis == true){  
  alt1_Opac = visible;
  }
  
  else if (alt1_vis == false){
  alt1_Opac = invisible;
  }
  
   // ======================================================== ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
   
   
   if (mouseX>width/2){
    alt1_vis = true;
    win1_vis = false;
   }
   
   
   else {
  alt1_vis = false;
  win1_vis = true;
   }
   
} 





void rotateAboutEllipseCenter() {
  
  pushMatrix();   //Something built into processing that allows for the translation of parts? Not fully understood but hey it works and can be modded ez pz!

  fill(255, 0, 0, win1_Opac);  //WIN 1 - COlOR/TRANSPARENCY *    [Windshield 1 Properties]
  strokeWeight(2);                                 // * 
  stroke(0, 0, 0, win1_Opac);                              // *

  // Windshield 1 Physics
  pushMatrix();
  translate(-100, -35);   //Coordinates of the Ellipse
  rotate(clockwiseSlow);          //Rotate using the defined [[ANGLE]] var float
  ellipse (0, 0, 245, 45);      //Create the Ellipse
  popMatrix();


                                                   //*        [AltWin 1 Propteries] 
  fill(255, 0, 0, alt1_Opac);  //WIN 1 ALT - COLOR/TRANSPARENCY (last property is opacity) can use that as a var to easy hide and show   
  stroke(0, 0, 0, alt1_Opac);     // * opacity on stroke hides outline :D

  // Windshield 1 ALT Physics

  pushMatrix();
  translate(-100, -35);   //Coordinates of the Ellipse
  rotate(countClockwiseSlow);          //Rotate using the defined [[ANGLE]] var float
  ellipse (0, 0, 245, 45);      //Create the Ellipse
  popMatrix();







  popMatrix();                //Two of these at the end or error
}
