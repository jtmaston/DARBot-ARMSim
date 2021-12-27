PShape base, segment, small, joint;

PShape point;


float rotX, rotY;
float posX=1, posY=50, posZ=50;
float alpha, beta, gamma;

int zoom = - 300;


float axis1 = 0;
float axis2 = 0;
float axis3 = 0;
float axis4 = 0;
float axis5 = 0;
float axis6 = 0;

float deg = 0.174533;
int i = 0;

float add = 0;
float add2 = 0;
float add3 = 0;
float add4 = 0;
float add5 = 0;


int target_x = 150;
int target_y = 200;
int target_z = 0;

void setup(){
    size(1900, 1000, P3D);
    
    base = loadShape("r5.obj");
    segment = loadShape("r2.obj");
    small = loadShape("r2.obj");
    joint = createShape(SPHERE, 10);
    point = createShape(SPHERE, 10);
    
    
    segment.disableStyle();
    joint.disableStyle();
}

void draw(){ 
   
   //writePos();
   background(32);
   shapeMode(CORNER);
   smooth();
   lights(); 
   directionalLight(51, 102, 126, -1, 0, 0);
   
   fill(#FFE308); 
   noStroke();
  
   translate(width / 2,height / 2, zoom);
   rotateX(rotX);
   rotateY(rotY);
   
   pushMatrix();
   scale(-6.0);
   
   translate(75, 75, 0);
   rotateX(PI);
   shape(base);
   
   axis1 += add;
   rotateY ( axis1 );
   
   translate (5, -5, 0);
   rotateY(PI / 2.0);
   rotateX(- PI / 2.0 - PI / 4.0);
   scale(0.7, 1, 0.5);
   shape(segment);
   
   
   translate ( 0, 0, 50);
   scale( 10 / 7, 1, 10 / 5);
   rotateX( PI / 2.0);
   
   axis2 += add2;
   rotateZ(axis2);
   
   scale(0.7, 1, 0.5);
   shape(segment);
   
   scale( 10 / 7, 1, 10 / 5);
   shape(joint);
   scale(0.7, 1, 0.5);
   
   
   translate(0, 0, 50);
   scale( 10 / 7, 1, 10 / 5);
   
   axis3 +=  add3;
   rotateX(axis3);
   
   rotateX(- PI / 2.0);
   scale(0.7, 1.25, 1.25);
   shape(segment);
   
   translate(0, 0, 50);
   scale( 10 / 7, 100.0 / 125.0, 100.0 / 125.0);
   
   axis4 += add4;
   rotateX(axis4);
   
   rotateX(- 75 * deg - PI / 2);
   scale(0.7, 1, 0.9);
   shape(segment);
   
   
   translate(0, 0, 50);
   scale( 10 / 7, 1, 10 / 9);
   
   axis5 += add5;
   rotateX(axis5);
   
   rotateX(75.0 * deg + PI / 2.0);
   scale(0.7, 1, 0.9);
   shape(segment);
   
   scale(10 / 7, 1, 9 / 10);
  
    popMatrix();
   
    pushMatrix();
    translate(-450, 0, 0);
    rotateX(PI / 2);
    
    stroke(192,0,0);
    line(-7500,0,0,15000,0,0);
    //Y - green
    stroke(0,192,0);
    line(0,-7500,0,0,15000,0);
    //Z - blue
    stroke(0,0,192);
    line(0,0,-7500,0,0,15000);
    popMatrix();
    
    pushMatrix();
    rotateX(PI / 2);
    //rectMode(CENTER);
    stroke(192,0,0);
    
    //line(-30,0,0,60,0,0);
    //line(0,-30,0,60,0,0);
    
    ellipse(target_x, target_y, 60 ,60);
    
    popMatrix();
}

void keyPressed() {
  println(keyCode);
  switch (keyCode)
  {
     case 39: add = 0.174533 / 4.0; break;
     case 37: add = -0.174533 / 4.0;  break;
     case 132: add2 = 0.174533 / 4.0; break;
     case 134: add2 = -0.174533 / 4.0; break;
     case 136: add3 = 0.174533 / 4.0; break;
     case 130
: add3 = -0.174533 / 4.0; break;
     case 135: add4 = 0.174533 / 4.0; break;
     case 129: add4 = -0.174533 / 4.0; break;
     case 137: add5 =  0.174533 / 4.0; break;
     case 131: add5 = -0.174533 / 4.0; break;
  }
}

void keyReleased() {
  add = 0;
  add2 = 0;
  add3 = 0;
  add4 = 0;
  add5 = 0;
}


void mouseWheel(MouseEvent event)
{
  zoom -= event.getCount() * 50;
}

void mouseDragged(){
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
    
}
