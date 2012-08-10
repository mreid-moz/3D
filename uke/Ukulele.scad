//// VARIABLES ////
body_height = 35;
large_radius = 65;
small_radius = 45;
circle_offset = 20;
back_thickness = 3;
front_thickness = back_thickness;
hole_radius = 26.5;
small_offset = 130;
hole_offset = small_offset - 35;
saddle_base_width = 20;
saddle_base_length = 60;
saddle_base_height = 3;
neck_bottom_radius = body_height / 2;
neck_top_radius = neck_bottom_radius * 0.65;
neck_length = 150;
neck_quality = 30;

head_width = neck_top_radius * 2 + 10;
head_length = small_radius;
head_thickness = body_height * 0.2;
head_angle = 15;

module body() {
 back();
 front();
 sides();
}

module uke_shape(thickness) {
 hull() {
  translate([0,-1*circle_offset,0]) cylinder(r=large_radius, h=thickness);
  translate([0,circle_offset,0]) cylinder(r=large_radius, h=thickness);
 }

 hull() {
  translate([small_offset,-1*circle_offset,0]) cylinder(r=small_radius, h=thickness);
  translate([small_offset,circle_offset,0]) cylinder(r=small_radius, h=thickness);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,thickness]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=thickness);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=thickness);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=thickness);
 }
}

module back() {
 uke_shape(back_thickness);
}

module front() {
 difference() {
  translate([0,0,body_height])
   uke_shape(front_thickness);
  translate([hole_offset,0,body_height-1])
   #cylinder(r=hole_radius, h=front_thickness+2);
 }
 saddle();
}

module saddle() {
 color("green") translate([saddle_base_width / -2, saddle_base_length / -2, body_height+front_thickness]) 
  cube(size=[saddle_base_width, saddle_base_length, saddle_base_height]);

}

module sides() {
 difference() {
  uke_shape(body_height);
  translate([5,0,-10])
   scale([0.9,0.9,0.9])
    uke_shape(body_height);
  translate([5,0,10])
   scale([0.9,0.9,0.9])
    uke_shape(body_height);
 }
}

module head() {
 angle_distance = 2;
 translate([neck_length + small_offset + small_radius - angle_distance, head_width * -0.5, body_height + front_thickness - head_thickness])
  rotate([0,head_angle,0])
   cube(size=[head_length, head_width, head_thickness]); 
}

module neck() {
 rotate([0,90,0])
  translate([-2*neck_bottom_radius - front_thickness,0,small_offset + small_radius])
   difference() {
    cylinder(r1=neck_bottom_radius, r2=neck_top_radius, h=neck_length, $fn=neck_quality);
    translate([-2*neck_bottom_radius, -1*neck_bottom_radius, -1]) cube(size=[neck_bottom_radius * 2, neck_bottom_radius * 2, neck_length + 2]);
   }

 translate([small_offset + small_radius, 0, 0]) cylinder(r2=neck_bottom_radius, r1=neck_bottom_radius * 0.3, h=body_height + front_thickness);
}

module nut() {
}

body();
neck();
head();
