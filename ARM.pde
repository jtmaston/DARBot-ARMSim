class ARM
{
    // angles for all the axes, relative to the coordinate system
    float angle_1 = 0;                    float target_1 = 0;
    float angle_2 = 0;                    float target_2 = 0;
    float angle_3 = 0;                    float target_3 = 0;
    float angle_4 = 0;                    float target_4 = 0;
    float angle_5 = 0;                    float target_5 = 0;
    float angle_6 = 0;                    float target_6 = 0;
    
    // lengths of each segment
    int l1;
    int l2;
    int l3;
    int l4;
    int l5;
    int l6;

    void calculate(int x, int y, int z)
    {
        target_1 = asin(radians(z / (x * x + z * z)));
    }

    void calculate(Point target)
    {
        //print(target.x);print(" ");print(target.y);print(" ");println(target.z);
        this.target_1 = floor(degrees(atan(target.z / target.x)));

        println(this.target_1);
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
        ellipse(x, z, 10 ,10);
    }
}
