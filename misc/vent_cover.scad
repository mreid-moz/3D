
$fn=50;

difference() {
    cylinder(r=50, h=3);
    translate([0,0,-1])
     cylinder(r=47, h=5);
}

difference() {
translate([-49,-5,0])
 rotate([0,-8,0])
  cube(size=[2,10,10]);

translate([-50,-6,-5])
 #cube(size=[4,12,5]);
}

difference() {
translate([47,-5,0])
 rotate([0,8,0])
  cube(size=[2,10,10]);
    
translate([46,-6,-5])
 #cube(size=[4,12,5]);
}


difference() {
translate([-5,-49,0])
 rotate([8,0,0])
  cube(size=[10,2,10]);

translate([-6,-50,-5])
 #cube(size=[12,4,5]);
}

difference() {
translate([-5,47,0])
 rotate([-8,0,0])
  cube(size=[10,2,10]);
    
translate([-6,46,-5])
 #cube(size=[12,4,5]);
}