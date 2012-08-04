module body() {
 back();
 front();
 sides();
}

module back() {
 hull() {
  translate([0,-20,0]) cylinder(r=65, h=35);
  translate([0,20,0]) cylinder(r=65, h=35);
 }

 hull() {
  translate([130,-20,0]) cylinder(r=45, h=35);
  translate([130,20,0]) cylinder(r=45, h=35);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,35]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=35);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=35);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=35);
 }
}

module front() {
 hull() {
  translate([0,-20,0]) cylinder(r=65, h=35);
  translate([0,20,0]) cylinder(r=65, h=35);
 }

 hull() {
  translate([130,-20,0]) cylinder(r=45, h=35);
  translate([130,20,0]) cylinder(r=45, h=35);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,35]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=35);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=35);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=35);
 }
}

module saddle() {
}

module sides() {
 hull() {
  translate([0,-20,0]) cylinder(r=65, h=35);
  translate([0,20,0]) cylinder(r=65, h=35);
 }

 hull() {
  translate([130,-20,0]) cylinder(r=45, h=35);
  translate([130,20,0]) cylinder(r=45, h=35);
 }

 difference() {
  color("red")
   translate([30,-70,0]) cube(size=[85,140,35]);

  color("blue") 
   translate([82.8,112.7,0]) cylinder(r=60,h=35);

 // color("blue") 
 //  translate([87,-158,0]) cylinder(r=100,h=35);
  color("blue") 
   translate([82.8,-112.7,0]) cylinder(r=60,h=35);
 }
}

module neck() {
}

module nut() {
}

body();