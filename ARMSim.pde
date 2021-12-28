PShape base, segment, small, joint;

PShape target;
Point tgt = new Point(325, 200, 0);

ARM Bot = new ARM();

float rotX, rotY;
float posX=1, posY=50, posZ=50;
float alpha, beta, gamma;

int zoom = - 300;

float deg = 0.174533;
int i = 0;
boolean start = false;

void setup(){
    size(1900, 1000, P3D);

    base = loadShape("r5.obj");
    segment = loadShape("r2.obj");
    small = loadShape("r2.obj");
    joint = createShape(SPHERE, 10);
    target = createShape(SPHERE, 10);

    Bot.calculate(tgt);
    
    frameRate(60);

    segment.disableStyle();
    joint.disableStyle();
}

long frame = 0;

void draw(){ 
    frame++;

    background(32);
    shapeMode(CORNER);
    smooth();
    lights(); 
    directionalLight(51, 102, 126, -1, 0, 0);
   
    fill(#FFE308); 
    noStroke();
  
    // DRAW THE ROBOT ARM \\
  
    translate(width / 2,height / 2, zoom);
    //translate(0, height/2, zoom);
    rotateX(rotX);
    rotateY(rotY);
   
    pushMatrix();
    scale(-6.0);
   
    translate(0, 75, 0);
    rotateX(PI);
    shape(base);
    
    if(floor(Bot.angle_1) != Bot.target_1 && start)
    {
        print(Bot.angle_1);print(" ");
        println(Bot.target_1);
        if( Bot.angle_1 > Bot.target_1)
        {
            Bot.angle_1 -= 1.0;
        }
        else
        {
            Bot.angle_1 += 1.0;
        }
        
    }
    rotateY(radians(Bot.angle_1));
    
    translate (5, -5, 0);
    rotateY(PI / 2.0);
    rotateX(- PI / 2.0 - PI / 4.0);
    scale(0.7, 1, 0.5);
    shape(segment);
    
    
    translate ( 0, 0, 50);
    scale( 10 / 7, 1, 10 / 5);
    rotateX( PI / 2.0);
    
    rotateZ( Bot.angle_2 );
    
    scale(0.7, 1, 0.5);
    shape(segment);
    
    scale( 10 / 7, 1, 10 / 5);
    shape(joint);
    scale(0.7, 1, 0.5);
    
    
    translate(0, 0, 50);
    scale( 10 / 7, 1, 10 / 5);
    
    rotateX(Bot.angle_3);
    
    rotateX(- PI / 2.0);
    scale(0.7, 1.25, 1.25);
    shape(segment);
    
    translate(0, 0, 50);
    scale( 10 / 7, 100.0 / 125.0, 100.0 / 125.0);
    
    rotateX(Bot.angle_4);
    
    rotateX(- 75 * deg - PI / 2);
    scale(0.7, 1, 0.9);
    shape(segment);
    
    
    translate(0, 0, 50);
    scale( 10 / 7, 1, 10 / 9);
    
    rotateX(Bot.angle_5);
    
    rotateX(75.0 * deg + PI / 2.0);
    scale(0.7, 1, 0.9);
    shape(segment);
    
    scale(10 / 7, 1, 9 / 10);
    
    popMatrix();
    
    
    // DRAW THE AXES \\
    
    pushMatrix();
    //translate(-450, 0, 0);
    rotateX(PI / 2);
        
    stroke(192,0,0);
    line(-7500,0,0,15000,0,0);

    stroke(0,192,0);
    line(0,-7500,0,0,15000,0);

    stroke(0,0,192);
    line(0,0,-7500,0,0,15000);
    popMatrix();
        
        
    // DRAW THE TARGET \\ 
    
    pushMatrix();
    rotateX(PI / 2);
    //rectMode(CENTER);
    stroke(192,0,0);
    
    tgt.display();
        
    popMatrix();
}

void keyPressed() {
    start = true;
}

void mouseWheel(MouseEvent event)
{
  zoom -= event.getCount() * 50;
}

void mouseDragged(){
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
    
}
