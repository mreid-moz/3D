cq = 70;

bottom_outer_diam = 37.4;
bottom_outer_rad = bottom_outer_diam / 2;

bottom_inner_diam = 32.2;
bottom_inner_rad = bottom_inner_diam / 2;

top_outer_diam = 30.8;
top_outer_rad = top_outer_diam / 2;

top_inner_diam = 26.72;
top_inner_rad = top_inner_diam / 2;

height = 80;

feet_stick_out = 0.4;
feet_width = 3.14;
feet_height = 30;

rad_diff = bottom_inner_rad - top_inner_rad; // 2.74

// WTF... Shouldn't it be opposide / adjacent? Soh Cah Toa!
//inside_angle = atan(height / rad_diff);
inside_angle = atan(rad_diff / height);

module feet_pair() {
 translate([bottom_inner_rad - feet_stick_out, -feet_width / 2, 0])
  rotate([0,-inside_angle,0]) cube(size=[feet_stick_out * 2, feet_width, feet_height]);

 translate([-bottom_inner_rad - feet_stick_out, -feet_width / 2, 0])
  rotate([0,inside_angle,0]) cube(size=[feet_stick_out * 2, feet_width, feet_height]);
}

module feet() {
 feet_pair();

 rotate([0,0,90]) {
  feet();
 }
}

echo("bottom_inner_rad = ", bottom_inner_rad, " top_inner_rad = ", top_inner_rad, " diff = ", rad_diff, "inside_angle = ", inside_angle);


scale([0.954, 0.969, 0.952]) {
 difference() {
  cylinder(r1=bottom_outer_rad, r2 = top_outer_rad, h = height, $fn = cq);
  translate([0, 0, -1]) cylinder(r1=bottom_inner_rad, r2 = top_inner_rad, h = height + 2, $fn = cq);
 }

 feet();
}
