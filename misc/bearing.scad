  //depth, diameter, id_diameter
module ball_bearing(container_h, container_w, container_id, fudge_balls, fudge_degrees) {
    spacing = 0.30;
    bearing_r=(container_h-spacing/2)/2;
    ball_channel_r = container_w/2 - (bearing_r+spacing*3) ;
    radius = 50;
    pi = 3.14;
    bearing_count = radius*pi/(bearing_r+spacing*3)-fudge_balls;

    difference() {
        translate([0,0,-container_h/2]) {
            //inner cylinder
            difference() {
                cylinder(r=ball_channel_r-bearing_r/3, h=container_h);
                cylinder(r=container_id/2, h=container_h);
            }
            //outer
            difference() {
                cylinder(r=container_w/2, h=container_h, $fn=container_w/2);
                cylinder(r=ball_channel_r+bearing_r/3, h=container_h);
            }
        }

        rotate_extrude()
        translate ([ball_channel_r,0,0]){
            circle(r=bearing_r+spacing);
        }
    }

    for ( i = [0 : bearing_count-1] )
    {
        rotate( i * 360 / (bearing_count/fudge_degrees), [0, 0, 1])
        translate([0, ball_channel_r-spacing, 0])
        #    sphere(r = bearing_r);
    }

}
ball_bearing(30, 100,10, 3, 1.04);
