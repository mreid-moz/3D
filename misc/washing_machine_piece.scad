// cylinder quality
cq = 50;

thickness = 7.65;
length = 53.42;
width = 60.65;
inner_diam = 31.75;
inset = 3.12;
inner_rad = inner_diam / 2;
inset_xoff = 6;
inset_yoff = 7.12;

module p1() {
 difference() {
  cube(size=[length, width, thickness]);
  translate([inner_rad + 9.29, inner_rad + 14.33, -1]) cylinder(r=inner_rad, h=thickness + 2, $fn=cq);
 }
}

module p2() {
 intersection() {
  p1();
  translate([length/2, width/2, -1]) cylinder(r=width/2 + 2, h=thickness+2, $fn=cq);
 }
}

module p3() {
 difference() {
  p2();
  translate([inset_xoff, inset_yoff, -1]) {
   //cube(size=[length - 2 * inset_xoff, width - 2 * inset_yoff, inset + 1]);
   cube(size=[length / 2, width / 2, inset + 1]);
   translate([length / 2 - 2 * inset_xoff, width / 2 - 2 * inset_yoff, 0])
    cube(size=[length / 2, width / 2, inset + 1]);
   
  }
  translate([length / 2 + 3,width / 2 - 5.6,-1])
   cylinder(r=inner_rad + 2, h=inset + 1, $fn=cq);
  translate([length / 2 - 3,width / 2 + 5.6,-1])
   cylinder(r=inner_rad + 2, h=inset + 1, $fn=cq);
 }
}

p3();

translate([13.09 - 1.4, 15.5 - 1.4, 0]) cylinder(r=1.4, h=thickness, $fn=cq);
translate([40.11 - 1.4, 47.6 - 1.4, 0]) cylinder(r=1.4, h=thickness, $fn=cq);
