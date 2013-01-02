amp_height = 70;
amp_width = 70;
amp_depth = 40;
speaker_radius = 20;
speaker_diam = speaker_radius * 2;

front_bevel_width = 5;

inner_height = amp_height - 2 * front_bevel_width;
inner_width = amp_width - 2 * front_bevel_width;

// From elmom here: https://github.com/elmom/MCAD/blob/master/regular_shapes.scad
module square_pyramid(base_x, base_y,height)
{
  w=base_x/2;
  h=base_y/2;
  polyhedron(points=[[-w,-h,0],[-w,h,0],[w,h,0],[w,-h,0],[0,0,height]],triangles=[[0,3,2,1], [0,1,4], [1,2,4], [2,3,4], [3,0,4]]);
}
module screw_hole(xoff, zoff) {
 translate([front_bevel_width + xoff, 2, front_bevel_width + zoff])
  rotate([-90,0,0])
   difference() {
    cylinder(r=3, h=amp_depth - front_bevel_width - 2, $fn=20);
    cylinder(r=1, h=amp_depth - front_bevel_width - 2, $fn=20);
   }
}

module cab() {
 difference() {
  cube(size=[amp_width, amp_depth, amp_height]);
  translate([inner_width/2 + front_bevel_width, -1, inner_height/2 + front_bevel_width])
   rotate(a=[-90,0,0])
    square_pyramid(inner_width+front_bevel_width,inner_height+front_bevel_width,15);
  translate([front_bevel_width, front_bevel_width-3, front_bevel_width])
   cube(size=[inner_width, amp_depth+2, inner_height]);
  translate([front_bevel_width*2, amp_depth/2, amp_height-front_bevel_width+2])
   cube(size=[inner_width - 2 * front_bevel_width, amp_depth, front_bevel_width]);
  translate([front_bevel_width - 2, amp_depth - front_bevel_width, front_bevel_width])
   cube(size=[inner_width + 4, front_bevel_width+1, inner_height]);
  translate([amp_width - 49, amp_depth - 12, amp_height - 10])
   #cylinder(r=3, h=amp_depth - front_bevel_width - 2, $fn=20);
  translate([amp_width - 38, amp_depth - 12, amp_height - 10])
   #cylinder(r=5.5, h=amp_depth - front_bevel_width - 2, $fn=20);
  translate([amp_width - 22, amp_depth - 12, amp_height - 10])
   #cylinder(r=4, h=amp_depth - front_bevel_width - 2, $fn=20);
  translate([amp_width - front_bevel_width - 1, amp_depth - 11, inner_height - 13])
   rotate([0,90,0])
    #cylinder(r=2.5, h=amp_depth - front_bevel_width - 2, $fn=20);
 }
 screw_hole(0, 10);
 screw_hole(inner_width, 10);
 screw_hole(0, inner_height - 10);
 screw_hole(inner_width, inner_height - 10);

}

module screw_hole_back(xoff, zoff) {
 translate([2 + xoff, -1, zoff])
  rotate([-90,0,0])
   cylinder(r=1, h=front_bevel_width + 2, $fn=20);
}

module back() {
 translate([front_bevel_width-2, amp_depth-front_bevel_width, front_bevel_width]) {
  difference() {
   cube(size=[inner_width + 4, front_bevel_width, inner_height]);
   screw_hole_back(0, 10);
   screw_hole_back(inner_width, 10);
   screw_hole_back(0, inner_height - 10);
   screw_hole_back(inner_width, inner_height - 10);
  }
 }
}

module innards() {
 difference() {
  union() {
   cube(size=[inner_width, amp_depth/2, inner_height/3]);
   translate([inner_width/2 - 5, 0, 0])
    cube(size=[10, front_bevel_width + 5, speaker_diam + front_bevel_width + 2]);
  }
  translate([inner_width/2, -1, speaker_radius + front_bevel_width])
   rotate([-90,0,0])
    #cylinder(r=speaker_radius, h=front_bevel_width + 3, $fn=50);
  translate([(inner_width - speaker_diam) / 2 - 1, 10, front_bevel_width])
   #cube(size=[speaker_diam + 2, amp_depth/2, inner_height/3]);
 }
}

//rotate([90,0,0])
 cab();
//back();
//innards();
