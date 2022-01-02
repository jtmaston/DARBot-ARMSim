PShape target;
Point tgt = new Point(325, 200, 0);

ARM Bot = new ARM();

float rotX, rotY;
float posX=1, posY=50, posZ=50;
float alpha, beta, gamma;

int zoom = 10;

float deg = 0.174533;
int i = 0;
boolean start = false;

void setup(){
    size(1900, 1000, P3D);
    
    Bot.load();
    Bot.calculate(tgt);
    frameRate(60);
}

long frame = 0;

void draw(){ 
    frame++;
    sceneInit();                                    // intializes the scene
    sceneRotate();                                  // rotates to apply mouse movements
    axes();                                         // draws the axes
    
    Bot.draw();

    /*translate(0, 75, 0);
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
    
    */
        
        
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
    switch (keyCode) {
        case 52:
            rotX = 0;
            rotY = PI / 2;
            break;
        case 54:
            rotX = 0;
            rotY = -PI / 2;
            break;
        case 56:
            rotX = PI / 2;
            rotY = 0;
            break;
        case 50:
            rotX = -PI / 2;
            rotY = 0;
            break;
        case 53:
            rotX = -PI / 6;
            rotY = -PI / 4;
            break;
        
    }
}

void mouseWheel(MouseEvent event)
{
  zoom -= event.getCount() * 50;
}

void mouseDragged(){
    rotY += (mouseX - pmouseX) * 0.01;
    rotX += (mouseY - pmouseY) * 0.01;
}
