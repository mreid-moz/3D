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
}

module saddle() {
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

module neck() {
}

module nut() {
}

body();
