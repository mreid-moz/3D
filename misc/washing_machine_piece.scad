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
  translate([length/2 - 3, width/2, -1]) cylinder(r=width/2 + 2, h=thickness+2, $fn=cq);
 }
}

module p3() {
 difference() {
  p2();
  translate([inset_xoff, inset_yoff, -1]) {
   //cube(size=[length - 2 * inset_xoff, width - 2 * inset_yoff, inset + 1]);
   cube(size=[22.5, width / 2, inset + 1]);
   translate([21.8 - inset_xoff, width / 2 - 2 * inset_yoff, 0])
    cube(size=[22.5, width / 2, inset + 1]);

  }
  translate([26.4,25,-1])
   cylinder(r=inner_rad + 2, h=inset + 1, $fn=cq);
  translate([24,35.7,-1])
   cylinder(r=inner_rad + 2, h=inset + 1, $fn=cq);
 }
}

module p4() {
 p3();

 translate([13.09 - 1.4, 15.5 - 1.4, 0]) cylinder(r=1.4, h=thickness, $fn=cq);
 translate([40.11 - 1.4, 47.6 - 1.4, 0]) cylinder(r=1.4, h=thickness, $fn=cq);
}

module p5() {
 difference() {
  p4();
  translate([47.49, 29.55, -1]) {
   cube(size=[14, 30, thickness + 2]);
   translate([2,0,0]) cylinder(r=2, h=thickness + 2, $fn=cq);
  }
 }

 difference() {
  p6();
  translate([length - 3.3 - 0.1, 21, thickness])
   rotate([36, 0, 0])
    cube(size=[4.5, 40, 28]);
 }

}

// Stick-outy arm on the right top
module p6() {
 translate([length - 2.3, 21, 0])
//TODO:  rotate([0,0,-5])
  cube(size=[2.3, 28.55, 28]);
 translate([length - 1.75, 48, 2])
  cylinder(r=1.5, h=28, $fn=cq);
}

module p7() {
 difference() {
  p5();
  translate([length - 5, 44, -15])
   rotate([36,0,0])
    translate([12,0,0])
     rotate([0,-50,0])
      cube(size=[9,20,15]);
  translate([length - 2.3, 49.5, -1])
   cube([10,10,10]);
 }

 difference() {
  translate([inset + inset_xoff + inner_rad,width - 12,0])
   rotate([0,0,10])
    cube(size=[40, 12, 31]);
  translate([inset_xoff, inset_yoff, -1]) {
   cube(size=[22.5, width / 2, inset + 1]);
   translate([21.8 - inset_xoff, width / 2 - 2 * inset_yoff, 0])
    cube(size=[22.5, width / 2, inset + 1]);
  }
  translate([inset + inset_xoff + inner_rad,width - 12 - 1,thickness]) {
   rotate([0,-45,10])
    cube(size=[40, 14, 31]);
 // translate([inset + inset_xoff + inner_rad,width - 12 - 1,thickness])
   rotate([0,0,10])
    cube(size=[20, 10, 31]);
   translate([20,0,0])
    rotate([0,-60,10])
     cube(size=[40, 13, 31]);
   translate([23,9,0])
    rotate([0,-60,10])
     cube(size=[40, 5, 31]);
  }
 }
}

intersection() {
 p7();
 translate([25,30,50]) sphere(r=60, $fn=100);
}
