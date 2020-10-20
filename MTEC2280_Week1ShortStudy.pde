//Week 1 Short Study ~Chris Avendano          //A title for the drawing


int zer = 0;        //At least 3 different types of primitives
int min = 4;
int max = 10;


void setup() {
  
 size (1080, 720);    //A canvas size of 1080x720
 background (255);


}
//size (width, height; //creating canvas size

void draw(){

 stroke(255,0,0);            //3 Different fill colors & strokes
 fill(0);
triangle (200, 300, 600, 300, 200, 400);


 stroke(0,255,0);
 fill(0,0,255);
triangle (00, 900, 200, 400, 800, 700);


 stroke(0,0,0);
 fill(0,255,0);
 rect(500, 400, 800, 700);


}
