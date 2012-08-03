difference() {
 translate([-10,-10, 0]) cube(size=[20, 20, 7]);
 translate([-3, -3,  3]) cube(size=[20, 20, 5]);
 translate([-4, -4, -2]) cylinder(h=10, r=1.5, center=false, $fn=15);
}