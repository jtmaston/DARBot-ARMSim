class ARM
{
    float  angles[]   = new float[6];
    float  targets[]  = new float[6];
    float  lengths[]  = new float[6];
    PShape segments[] = new PShape[10];
    boolean debugMode     = false;

    int segnum = 0;
    float rscale = 1;

    float height;

    void debug()
    {
        debugMode = true;
    }

    void load()
    {
        segments[0] = loadShape("mount.obj");
        segments[1] = loadShape("base.obj");
        //segments[2] = loadShape("seg1.obj");
        /*segments[3] = loadShape("Production/seg2.obj");
        segments[4] = loadShape("Production/seg3.obj");
        segments[5] = loadShape("Production/seg4.obj");
        segments[6] = loadShape("Production/seg5.obj");
        segments[7] = loadShape("Production/seg6.obj");
        segments[8] = loadShape("Production/seg7.obj");*/

        println(segments.length);
        for(int i = 0 ; i < 2; i++){
            print(segments[i].width);print(" ");println(segments[i].height);
            segments[0].disableStyle();
        }
    }


    void draw()
    {
        pushMatrix();
        scale(rscale);

         for(int i = 0 ; i < 2; i++){
            print(segments[i].width);print(" ");println(segments[i].height);
            segments[0].disableStyle();
        }

        translate(segments[0].width / 2, 0, 0);
        shape(segments[0]);
        shape(segments[1]);
        
       

        //shape(segments[2]);

        popMatrix();
    }

    void calculate(int x, int y, int z)
    {
        targets[0] = asin(radians(z / (x * x + z * z)));
    }

    void calculate(Point target)
    {
        //print(target.x);print(" ");print(target.y);print(" ");println(target.z);
        this.targets[0] = floor(degrees(atan(target.z / target.x)));

        //println(this.target_1);
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
