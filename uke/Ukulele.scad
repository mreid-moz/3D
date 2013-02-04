//// VARIABLES ////
// While most stuff is parameterized, some will require tweaking if they
// change.
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
neck_bottom_rad = 21.35;
neck_top_rad = 17.45;
neck_length = 150;
quality = 80;

head_width = neck_top_rad * 2 + 10;
head_length = small_radius * 1.4;
head_thickness = 11.5;
head_angle = 15;
head_rad = (head_width - neck_top_rad) / 4;
head_rad_big = 55;

nut_thickness = 2;
nut_height = 2;

string_rad = 1.5;
body_length = 100;

saddle_top_height = 5;
saddle_top_width = 53;
saddle_increment = (saddle_top_width - 14) / 2;
string_block_length = 9;

bridge_thickness = 3.3;

module body() {
 back_and_sides();
 front();
}

module uke_shape(thickness) {
 hull() {
  translate([0, -circle_offset, 0])
   cylinder(r=large_radius, h=thickness, $fn=quality);
  translate([0, circle_offset, 0])
   cylinder(r=large_radius, h=thickness, $fn=quality);
 }

 hull() {
  translate([small_offset, -circle_offset, 0])
   cylinder(r=small_radius, h=thickness, $fn=quality);
  translate([small_offset, circle_offset, 0])
   cylinder(r=small_radius, h=thickness, $fn=quality);
 }

 difference() {
  // TODO: parameterize this
  translate([30, -70, 0]) cube(size=[85, 140, thickness]);
  translate([82.8, 112.7, -1]) cylinder(r=60, h=thickness + 2, $fn=quality);
  translate([82.8, -112.7, -1]) cylinder(r=60, h=thickness + 2, $fn=quality);
 }
}

module back() {
 uke_shape(back_thickness);
}

module front() {
 difference() {
  translate([0, 0, body_height])
   uke_shape(front_thickness);
  translate([hole_offset, 0, body_height - 1])
   cylinder(r=hole_radius, h=front_thickness + 2, $fn=quality);
 }
 saddle();
}

module bridge() {
 bridge_height = saddle_top_height;
 bridge_x = saddle_base_width / -2;
 bridge_y = saddle_top_width / -2;
 bridge_z = body_height + front_thickness + saddle_base_height;
 bridge_rad = bridge_thickness / 2;
 translate([bridge_x, bridge_y, bridge_z]) {
  color("red") {
   translate([saddle_base_width - bridge_thickness * 2, 0, 0]) {
    cube(size=[bridge_thickness, saddle_top_width, bridge_height]);
    translate([bridge_rad, 0, bridge_height])
     rotate([-90, 0, 0])
      cylinder(r=bridge_rad, h=saddle_top_width, $fn=quality);
   }
  }
 }
}

module saddle() {
 translate([saddle_base_width / -2, 0, body_height + front_thickness]) {
  difference() {
   union() {
    // saddle base
    color("green") {
     translate([0, saddle_base_length / -2, 0])
      cube(size=[saddle_base_width, saddle_base_length, saddle_base_height]);
    }

    // raised saddle parts
    translate([0, saddle_top_width / -2, saddle_base_height]) {
     cube(size=[string_block_length, saddle_top_width, saddle_top_height]);
     translate([saddle_base_width - bridge_thickness, 0, 0])
      cube(size=[bridge_thickness, saddle_top_width, saddle_top_height]);

     difference() {
      translate([saddle_base_width - bridge_thickness * 3 - 5, 0, 0])
       cube(size=[bridge_thickness + 5, saddle_top_width, saddle_top_height]);
      // TODO: parameterize the subtracted part:
      translate([-3, -1, 6])
       rotate([0, 40, 0])
        cube(size=[15, 55, 15]);
     }
    }
   }

   // holes for the strings
   translate([-1, 0, saddle_top_height / 2 + saddle_base_height]) {
    string_hole(saddle_increment);
    string_hole(saddle_increment/3);
    string_hole(-saddle_increment/3);
    string_hole(-saddle_increment);
   }
  }
 }
}

module string_hole(increment) {
 translate([0, increment, 0])
  rotate([0, 90, 0])
   cylinder(r=string_rad, h=string_block_length + 2, $fn=quality);
}

module sides() {
 difference() {
  uke_shape(body_height);
  // TODO: parameterize this
  translate([4, 0, -10])
   scale([0.94, 0.87, 1.5])
    uke_shape(body_height);
 }
}

module head() {
 // TODO: Math... can you use it?  Angle distance should be calculated.
 angle_distance = 3;
 head_x = neck_length + small_offset + small_radius - angle_distance;
 head_y = head_width * -0.5;
 head_z = body_height + front_thickness - head_thickness;
 translate([head_x, head_y, head_z]) {
  rotate([0, head_angle, 0]) {
   difference() {
    cube(size=[head_length, head_width, head_thickness]);
    translate([0, 0, -1]) {
     cylinder(r1=head_rad * 2, r2=head_rad, h=head_thickness + 2, $fn=quality);
     translate([0, head_width, 0])
      cylinder(r1=head_rad * 2, r2=head_rad, h=head_thickness + 2, $fn=quality);

     // This one is just to make the headstock less boring.
     translate([head_length + head_rad_big - 4,head_width / 2, 0])
      cylinder(r=head_rad_big, h=head_thickness + 2, $fn=quality);
    }
   }
  }
 }
}

module neck() {
 neck_x = -2 * neck_bottom_rad - front_thickness + 1;
 neck_z = small_offset + small_radius;
 rotate([0, 90, 0])
  translate([neck_x, 0, neck_z])
   difference() {
    cylinder(r1=neck_bottom_rad, r2=neck_top_rad, h=neck_length, $fn=quality);
    translate([-2*neck_bottom_rad, -1*neck_bottom_rad, -1])
     cube(size=[neck_bottom_rad * 2, neck_bottom_rad * 2, neck_length + 2]);
   }

 difference() {
  translate([small_offset + small_radius, 0, 0])
   cylinder(r2=neck_bottom_rad, r1=neck_bottom_rad * 0.3, h=body_height);
  translate([0, 0, -0.5 * body_height]) sides();
 }
 head();
}

module nut() {
 color("red") {
  translate([neck_length + small_offset + small_radius, neck_top_rad * -1, body_height + front_thickness]) {
   cube(size=[nut_thickness,neck_top_rad * 2,nut_height]);
   difference() {
    rotate([-90,0,0]) translate([0,nut_height * -1,0]) cylinder(r=nut_thickness, h=neck_top_rad * 2, $fn=quality);
    translate([-nut_thickness, -1, 0]) cube(size=[nut_thickness,(neck_top_rad * 2) + 2,nut_height * 2]);
   }
  }
 }
}

module half_neck_base() {
 translate([small_offset + small_radius, 0, body_height/2]) cylinder(r2=neck_bottom_rad, r1=neck_bottom_rad * 0.65, h=body_height / 2, $fn=quality);

}

module complete_uke() {
 body();
 neck();
 //saddle();
 nut();
 bridge();
}

module complete_uke_exploded() {
 back_and_sides();

 translate([0, 200, -body_height])
  front();

 translate([-neck_length - small_offset/2, -150, body_height + front_thickness])
  rotate([180, 0, 0])
   neck();

 translate([0, 0,-body_height - front_thickness]) {
  translate([-neck_length - small_offset,100,0])
   nut();

  translate([80,100,-saddle_base_height])
   bridge();
 }
}

module back_and_sides() {
 back();

 difference() {
  sides();
  half_neck_base();
 }
}

//complete_uke();
complete_uke_exploded();

