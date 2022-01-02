void sceneInit()
{
    background(32);
    shapeMode(CORNER);
    smooth();
    lights(); 
    directionalLight(51, 102, 126, -1, 0, 0);
    ambientLight(51, 102, 126);
   
    fill(#808080); 
    noStroke();
}

void sceneRotate()
{
    translate(width / 2,height / 2, zoom);
    rotateX(rotX);
    rotateY(rotY);
}

void axes()
{
    pushMatrix();
    strokeJoin(BEVEL);
    scale(1);
    //translate(-450, 0, 0);
    rotateX(PI / 2);
        
    stroke(192,0,0);
    line(-7500,0,0,15000,0,0);

    stroke(0,192,0);
    line(0,-7500,0,0,15000,0);

    stroke(0,0,192);
    line(0,0,-7500,0,0,15000);
    popMatrix();
}
