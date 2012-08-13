tube_lg_diam = 41.275;
tube_sm_diam = 34.925;
tube_lg_rad = tube_lg_diam / 2;
tube_sm_rad = tube_sm_diam / 2;

module tubes() {
 color("green") {
  translate([0,0,-100]) cylinder(r=tube_lg_rad, h=200);
  rotate([0,90,0]) cylinder(r=tube_sm_rad, h=200);
 }
}

bracket_width = 100;
bracket_height = tube_lg_diam + 15;
bracket_depth = tube_sm_rad + 12;
back_bracket_width = bracket_width;
back_bracket_height = bracket_height;
back_bracket_depth = tube_lg_rad + 5;


latch_width = 1.5 * tube_lg_diam;
latch_height = 12.7;
latch_depth = 6.35;

sh_rad = 1.5;
module screw_hole(rad, depth) {
 translate([0,-50,0])
  rotate([-90,0,0])
   cylinder(r=rad, h=depth, $fn=30);
}

module screw_holes(rad, depth) {
  translate([tube_lg_rad + 10, 0, tube_sm_rad + 5])
   #screw_hole(rad, depth);
  translate([bracket_width - tube_lg_rad - 15, 0, tube_sm_rad + 5])
   #screw_hole(rad, depth);
  translate([tube_lg_rad + 10, 0, -1 * (tube_sm_rad + 5)])
   #screw_hole(rad, depth);
  translate([bracket_width - tube_lg_rad - 15, 0, -1 * (tube_sm_rad + 5)])
   #screw_hole(rad, depth);
}

module bracket(wid, ht, dep) {
 difference() {
  translate([-1 * tube_lg_rad,-1 * dep,-0.5 * ht])
   cube(size=[wid,dep,ht]);
  #tubes();
  #screw_holes(sh_rad, 51);
  #screw_holes(sh_rad * 2, 50-dep+5);
 }
}

hole_dist = 28.6;

module front() {
 difference() {
  bracket(bracket_width, bracket_height, bracket_depth);
  #translate([-1*tube_lg_rad, -1*bracket_depth, -0.5 * latch_height]) cube(size=[latch_width, latch_depth,latch_height]);
  #screw_hole(sh_rad, 51);
  translate([hole_dist,0,0]) screw_hole(sh_rad, 51);
 }
}

module back() {
 difference() {
  bracket(back_bracket_width, back_bracket_height, back_bracket_depth);
  #translate([-1*tube_lg_rad-1,-1*tube_lg_diam-1,-0.5*back_bracket_height-1]) cube(size=[tube_lg_diam+2,tube_lg_diam+2,back_bracket_height+2]);
 }
}

//screw_hole();
front();
// back:
//rotate([180,0,0])
//back();