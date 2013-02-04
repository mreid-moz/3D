//// VARIABLES ////
body_height = 40;
large_radius = 65;
small_radius = 45;
circle_offset = 20;
back_thickness = 3;
front_thickness = back_thickness;
hole_radius = 26.5;
small_offset = 130;
hole_offset = small_offset - 35;
saddle_base_width = 24;
saddle_base_length = 80;
saddle_base_height = 2;
neck_bottom_radius = 21.35;
neck_top_radius = 17.45;
neck_length = 150;
neck_quality = 80;
body_quality = neck_quality;

head_width = neck_top_radius * 2 + 10;
head_length = small_radius * 1.4;
head_thickness = 11.5;
head_angle = 15;
head_rad = (head_width - neck_top_radius) / 4;
head_rad_big = 55;

nut_thickness = 2;
nut_height = 2;

fretboard_thickness = 4;
module body() {
 back();
 front();

 difference() {
  sides();
  half_neck_base();
 }
}

module uke_shape(thickness) {
 hull() {
  translate([0,-1*circle_offset,0]) cylinder(r=large_radius, h=thickness, $fn=body_quality);
  translate([0,circle_offset,0]) cylinder(r=large_radius, h=thickness, $fn=body_quality);
 }

 hull() {
  translate([small_offset,-1*circle_offset,0]) cylinder(r=small_radius, h=thickness, $fn=body_quality);
  translate([small_offset,circle_offset,0]) cylinder(r=small_radius, h=thickness, $fn=body_quality);
 }

 difference() {
  translate([30,-70,0]) cube(size=[85,140,thickness]);
  translate([82.8,112.7,-1]) cylinder(r=60, h=thickness + 2, $fn=body_quality);
  translate([82.8,-112.7,-1]) cylinder(r=60, h=thickness + 2, $fn=body_quality);
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
   cylinder(r=hole_radius, h=front_thickness+2, $fn=body_quality);
 }
 saddle();
}

module saddle() {
 color("green") {
  translate([saddle_base_width / -2, saddle_base_length / -2, body_height+front_thickness])
   cube(size=[saddle_base_width, saddle_base_length, saddle_base_height]);
 }
 translate([saddle_base_width / -2, 53 / -2, body_height+front_thickness])
  cube(size=[9, 53, 7]);
 translate([saddle_base_width / 2 - 3.3, 53 / -2, body_height+front_thickness])
  cube(size=[3.3, 53, 7]);

  difference() {
   translate([saddle_base_width / -2 + 9, 53 / -2, body_height+front_thickness])
    cube(size=[8.3, 53, 7]);
   translate([saddle_base_width / -2 - 3, 53 / -2 - 1, body_height+front_thickness+8])
    rotate([0,40,0])
     cube(size=[15, 55, 15]);
  }
}

module sides() {
 difference() {
  uke_shape(body_height);
  translate([4,0,-10])
   scale([0.94,0.87,1.5])
    uke_shape(body_height);
 }
}

module head() {
 angle_distance = 3;
 translate([neck_length + small_offset + small_radius - angle_distance, head_width * -0.5, body_height + front_thickness - head_thickness]) {
  rotate([0,head_angle,0]) {
   difference() {
    cube(size=[head_length, head_width, head_thickness]);
    translate([0,0,-1]) {
     cylinder(r1=head_rad*2, r2=head_rad, h=head_thickness + 2, $fn=neck_quality);
     translate([0,head_width,0]) cylinder(r1=head_rad*2, r2=head_rad, h=head_thickness + 2, $fn=neck_quality);
     translate([head_length + head_rad_big - 4,head_width/2,0]) cylinder(r=head_rad_big, h=head_thickness + 2, $fn=neck_quality);
    }
   }
  }
 }
}

module neck() {
 rotate([0,90,0])
  translate([-2*neck_bottom_radius - front_thickness + 1,0,small_offset + small_radius])
   difference() {
    cylinder(r1=neck_bottom_radius, r2=neck_top_radius, h=neck_length, $fn=neck_quality);
    translate([-2*neck_bottom_radius, -1*neck_bottom_radius, -1]) cube(size=[neck_bottom_radius * 2, neck_bottom_radius * 2, neck_length + 2]);
   }

 translate([small_offset + small_radius, 0, 0]) cylinder(r2=neck_bottom_radius, r1=neck_bottom_radius * 0.3, h=body_height);
 nut();
 head();
}

module nut() {
 color("green") {
  translate([neck_length + small_offset + small_radius, neck_top_radius * -1, body_height + front_thickness]) {
   cube(size=[nut_thickness,neck_top_radius * 2,nut_height]);
   difference() {
    rotate([-90,0,0]) translate([0,nut_height * -1,0]) cylinder(r=nut_thickness, h=neck_top_radius * 2, $fn=neck_quality);
    translate([-nut_thickness, -1, 0]) cube(size=[nut_thickness,(neck_top_radius * 2) + 2,nut_height * 2]);
   }
  }
 }
}

module half_neck_base() {
 translate([small_offset + small_radius, 0, body_height/2]) cylinder(r2=neck_bottom_radius, r1=neck_bottom_radius * 0.65, h=body_height / 2);

}

body();

//translate([-100,100,0])
difference() {
 neck();
 translate([0,0,-0.5*body_height]) sides();
}

