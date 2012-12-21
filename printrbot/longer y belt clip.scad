
//#import("/home/mark/Dropbox/printrbot/things/printrbot/pb-Y-BarEnd-x4.stl");

stem_extension = 3.6 + 2.2;
base_len=32;
base_thickness=4;

stem_len = 20.25;
stem_thickness = 3.175; // 1/8"

gap_thickness = 2;

stem_end_gap = 10;

len =22.5 + stem_extension;
wid =10;
ht   =15;
cq  = 25;
slot_len = 2;

cyl_wid=8.5;
hole_wid=1.8;

xoff=0;
yoff=-base_len/2 - 1;
zoff=0;

r_outer_curve = stem_thickness + gap_thickness/2;
xco = stem_len ;
yco = r_outer_curve/2 + 0.5;

module base() {
 translate([xoff,yoff,zoff])
  difference() {
   cube(size=[base_thickness, base_len, ht]);
   // screw holes
   translate([-15,6,ht/2]) rotate([0,90,0])
    #cylinder(r=2,h=30,$fn=cq);
   translate([-15,26,ht/2]) rotate([0,90,0])
    #cylinder(r=2,h=30,$fn=cq);
  }
}

module sticks() {
 translate([0,stem_thickness/-2,0])
  cube(size=[stem_len + stem_extension, stem_thickness, ht]);
 translate([2,stem_thickness/-2 - stem_thickness - gap_thickness + 0.5,0])
  cube(size=[stem_len + stem_extension, stem_thickness - 0.5, ht]);
 translate([stem_end_gap + stem_extension,stem_thickness/2 + gap_thickness,0])
  cube(size=[stem_len - stem_end_gap, stem_thickness, ht]);
 
  difference() {
   translate([xco +stem_extension, yco, 0])
    cylinder(r=r_outer_curve, h=ht, $fn=cq);
   translate([1,stem_thickness/2,-1])
   cube(size=[stem_len+stem_extension,gap_thickness,ht+2]);
 }
}

base();
sticks();


//rotate([0,180,0]) translate([0,0,-ht]) #import("/home/mark/Dropbox/printrbot/things/printrbot/pb-BeltClip-x2.stl");