//import("/home/mark/Dropbox/printrbot/things/printrbot/pb-BeltClip-x2.stl");
//#import("/home/mark/Dropbox/printrbot/things/printrbot/pb-Y-BarEnd-x4.stl");

stem_extension = 3.6;
len =22.5 + stem_extension;
wid =10;
ht   =8;
cq  = 25;
slot_len = 2;

cyl_wid=8.5;
hole_wid=1.8;

xoff=-0.5*wid - 0.5;
yoff=1.5;

xco = 11;
yco = 14.4 + stem_extension;
module p() {
 difference() {
  union() {
   cube(size=[wid, len, ht]);
   translate([xco, yco, 0]) difference()
    cylinder(r=cyl_wid, h=ht, $fn=cq);
  }
  translate([xco,yco,-1]) cylinder(r=cyl_wid - 4.3, h=ht+2, $fn=cq);
 }
}


difference() {
union() {
translate([xoff,yoff,0]) {
 difference() {
  p();
  translate([-1,13+stem_extension,-1])
   cube(size=[wid+2, slot_len, ht+2]);
  rotate([-90,0,0]) translate([wid/2, ht/-2,-5]) #cylinder(r=hole_wid, h=len+10, $fn=cq);
 }
}

translate([-5.5, 23.85, 0]) cylinder(r=cyl_wid-4.73, h=ht, $fn=cq);
}

translate([-5.5,23,-1]) cylinder(r=1, h=ht+2, $fn=cq);
}