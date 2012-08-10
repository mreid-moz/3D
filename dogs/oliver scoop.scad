thickness = 3;
// 75mL == 75 cm^3 = 75000 mm^3
volume = 75 * 1000;
squat_ratio = 1;
pi = 3.141592635;
// volume = pi * r^2 * h
// h = 2 * r * squat_ratio
// volume = pi * r^2 * (2r * squat_ratio)
// volume / pi = r^3 * squat_ratio * 2
// (volume / pi) / (squat_ratio * 2) = r^3
// r = ((volume / pi) / (squat_ratio * 2)) ^ 1/3
inner_radius = pow(((volume / pi) / (squat_ratio * 2)), 1/3);
inner_height = 2 * inner_radius * squat_ratio;
outer_radius = inner_radius + thickness;
outer_height = inner_height + thickness;
// cylinder quality
cq = 30;

module handle() {

 translate([0,-1*outer_radius+thickness,inner_radius])
  rotate([0,90,0])
   difference() {
    cylinder(r=inner_radius, h=thickness+1, $fn=cq);
    cylinder(r=inner_radius-thickness-1, h=thickness+1, $fn=cq);
   }
}
difference() {
 union() {
  cylinder(r=outer_radius, h=outer_height, $fn=cq);
  handle();
 }
 #translate([0,0,thickness]) cylinder(r=inner_radius, h=inner_height + 1, $fn=cq);
}

