//// VARIABLES ////
body_height = 35;
large_radius = 65;
small_radius = 45;
circle_offset = 20;

module body() {
 back();
 front();
 sides();
}

module back() {
 hull() {
  translate([0,-1*circle_offset,0]) cylinder(r=large_radius, h=body_height);
  translate([0,circle_offset,0]) cylinder(r=large_radius, h=body_height);
 }

 hull() {
  translate([130,-1*circle_offset,0]) cylinder(r=small_radius, h=body_height);
  translate([130,circle_offset,0]) cylinder(r=small_radius, h=body_height);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,body_height]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=body_height);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=body_height);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=body_height);
 }
}

module front() {
 hull() {
  translate([0,-1*circle_offset,0]) cylinder(r=large_radius, h=body_height);
  translate([0,circle_offset,0]) cylinder(r=large_radius, h=body_height);
 }

 hull() {
  translate([130,-1*circle_offset,0]) cylinder(r=small_radius, h=body_height);
  translate([130,circle_offset,0]) cylinder(r=small_radius, h=body_height);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,body_height]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=body_height);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=body_height);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=body_height);
 }
}

module saddle() {
}

module sides() {
 hull() {
  translate([0,-1*circle_offset,0]) cylinder(r=large_radius, h=body_height);
  translate([0,circle_offset,0]) cylinder(r=large_radius, h=body_height);
 }

 hull() {
  translate([130,-1*circle_offset,0]) cylinder(r=small_radius, h=body_height);
  translate([130,circle_offset,0]) cylinder(r=small_radius, h=body_height);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,body_height]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=body_height);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=body_height);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=body_height);
 }
}

module neck() {
}

module nut() {
}

body();
