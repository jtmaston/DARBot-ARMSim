PShape target;
Point tgt = new Point(325, 500, 0);

ARM Bot = new ARM();

float rotX, rotY;

int zoom = 10;

float deg = 0.174533;
int i = 0;

PShape test;

boolean start;

void setup(){
    size(1900, 1000, P3D);
    
    Bot.load();
    Bot.calculate(tgt);
    frameRate(60);
    
}

long frame = 0;

void draw(){ 
    sceneInit();
    sceneRotate();
    axes();

    
    Bot.draw();
        
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
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}
