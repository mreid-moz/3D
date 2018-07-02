stem_length=65;
stem_width=5;
stem_height=5;

cq = 50;

base_length=8;
base_width=30;
base_height=8;

ball_rad = 8.6;

rotate([0,-30,0])
 translate([0,0,ball_rad+1.3])
  sphere(r=ball_rad, $fn=cq);
translate([-stem_width,-stem_width/2,0])
 cube(size=[stem_length,stem_width,stem_height]);

translate([stem_length-(base_length/2),-base_width/2,base_height/2])
 difference() {
  rotate([-90,0,0])
   cylinder(r=base_height/2, h=base_width, $fn=cq);

  translate([0,-1,0])
   rotate([-90,0,0])
    cylinder(r=base_height/2 - 2, h=base_width+2, $fn=cq);
 }
