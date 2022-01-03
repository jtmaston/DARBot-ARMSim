class ARM
{
    float  angles[]   = new float[6];
    float  targets[]  = new float[6];
    float  lengths[]  = new float[6];
    PShape segments[] = new PShape[10];
    boolean debugMode     = false;

    int x = 0, y = -70, z = 0;

    int segnum = 0;
    float rscale = 6;

    float height;

    void move(int tgtx, int tgty, int tgtz)
    {
        x = tgtx;
        y = tgty;
        z = tgtz;
    }

    void debug()
    {
        debugMode = true;
    }

    void load()
    {
        segments[0] = loadShape("mount.obj");
        segments[1] = loadShape("base.obj");
        segments[2] = loadShape("seg1.obj");
        segments[3] = loadShape("seg3.obj");
        segments[4] = loadShape("seg4.obj");
        segments[5] = loadShape("seg5.obj");
        segments[6] = loadShape("seg6.obj");
        segments[7] = loadShape("seg7.obj");
    }


    void draw()
    {
        pushMatrix();

        scale(rscale); 

        translate(x, y, z);

        shape(segments[0]);
        translate(0, -2, 0);
        move(0);

        rotateY(radians(angles[0]));
        shape(segments[1]);
        
        translate(0, segments[1].getHeight(), 0);
        shape(segments[2]);

        translate(0, segments[2].getHeight() + 4.9, 0);
        rotateZ(-PI / 4);
        translate(0, 1, 0);
        shape(segments[3]);

        shape(segments[4]);
        translate(0, segments[4].getHeight() - 7 ,0);
        rotateZ(- PI / 2);
        shape(segments[5]);

        translate(0, segments[5].getHeight() - 6, 0);
        rotateZ(-PI / 2);
        shape(segments[6]);

        translate(0, -segments[6].getHeight() + 6, 0);
        rotateZ(- PI / 4 + PI);
        rotateX(PI);
        shape(segments[7]);

        popMatrix();
    }

    void calculate(int x, int y, int z)
    {
        targets[0] = asin(radians(z / (x * x + z * z)));
    }

    void calculate(Point target)
    {
        //print(target.x);print(" ");print(target.y);print(" ");println(target.z);
        this.targets[0] = - degrees(atan(target.z / target.x));

        //println(this.target_1);
    }

    void move(int axis)
    {
        float modifier = 0;
        if(floor(angles[axis] * 10) != floor(targets[axis] * 10) && start)
        {
            print(angles[axis]); print(" ");
            println(targets[axis]);

            if( abs(angles[axis] - targets[axis]) > 5.0)
                modifier = 1.0;
            else
                modifier = 0.1;

            if( angles[axis] > targets[axis])
            {
                angles[axis] -= modifier;
            }
            else
            {
                angles[axis] += modifier;
            }
            
        }
        switch(axis)
        {
            case 1:
                
                break;
        }

        
    }

};

class Point
{
    float x;
    float y;
    float z;

    Point (float t_x, float t_z, float t_y){ x = t_x; y = t_y; z = t_z; }
    void display()
    {
        ellipseMode(CENTER);
        ellipse(x, z, 30 ,30);
    }
}
