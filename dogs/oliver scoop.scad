// Parametric scoop / cup with handle
// Mark Reid
// Aug 15, 2012

pi = 3.141592635;

// cylinder quality
cq = 40;

module handle(thickness, inner_radius, outer_radius) {
 translate([0,-1*outer_radius+thickness,inner_radius])
  rotate([0,90,0])
   difference() {
    cylinder(r=inner_radius, h=thickness+1, $fn=cq);
    translate([0,0,-1]) cylinder(r=inner_radius-thickness-1, h=thickness+3, $fn=cq);
   }
}

// volume_ml => Inner volume of the scoop in millilitres
// thickness => Wall thickness in millimeters
// squatness => Ratio of scoop width to height.
//              Less than 1 is a short fat scoop, more than 1 is a tall skinny scoop.
module scoop(volume_ml, thickness, squatness) {
 // volume = pi * r^2 * h
 // h = 2 * r * squat_ratio
 // volume = pi * r^2 * (2r * squat_ratio)
 // volume / pi = r^3 * squat_ratio * 2
 // (volume / pi) / (squat_ratio * 2) = r^3
 // r = ((volume / pi) / (squat_ratio * 2)) ^ 1/3

 // 1mL == 1 cm^3 == 1000 mm^3
 volume = volume_ml * 1000;
 inner_radius = pow(((volume / pi) / (squatness * 2)), 1/3);
 inner_height = 2 * inner_radius * squatness;
 outer_radius = inner_radius + thickness;
 outer_height = inner_height + thickness;
 difference() {
  union() {
   cylinder(r=outer_radius, h=outer_height, $fn=cq);
   handle(thickness, inner_height / 2, outer_radius);
  }
  translate([0,0,thickness]) cylinder(r=inner_radius, h=inner_height + 1, $fn=cq);
 }
}


scoop(75, 3, 1);
//translate([100, 0, 0]) scoop(75, 3, 0.5);
//translate([0, 100, 0]) scoop(200, 4, 0.5);
//translate([-100, 0, 0]) scoop(75, 3, 1.5);
//translate([0, -100, 0]) scoop(200, 1, 1.5);
