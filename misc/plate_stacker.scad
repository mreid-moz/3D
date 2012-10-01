

// cylinder quality
cq = 40;

thickness = 4;
inner_radius = 180;
outer_radius = inner_radius + thickness;
height = 40;

module punch() {
 translate([inner_radius - 3, 0,(height/2) + thickness + 1])
  rotate([0,90,0])
   linear_extrude(height=thickness + 6)
    circle(r=(height-thickness-2)/2, $fn=3);
}
module punch_up() {
 translate([inner_radius + 7, 0,(height/2) - thickness - 1])
 rotate([0,-90,0])
   linear_extrude(height=thickness + 6)
    circle(r=(height-thickness-2)/2, $fn=3);
}

 difference() {
   cylinder(r=outer_radius, h=height, $fn=cq);
   translate([0,0,-1]) cylinder(r=inner_radius, h=height + 2, $fn=cq);
   for (z = [12 : 12 : 360]) {
    rotate([0,0,z]) punch();
   }
   for (z = [6 : 12 : 360]) {
    rotate([0,0,z]) punch_up();
   }
 }

/*
// stackable rim:
translate([0,0,height]) {
 difference() {
   cylinder(r1=outer_radius, r2=outer_radius + 4, h=thickness * 2, $fn=cq);
   translate([0,0,-1]) cylinder(r1=inner_radius, r2=inner_radius - 4, h=thickness * 2 + 2, $fn=cq);
   #translate([0,0,thickness])
    difference() {
     cylinder(r=outer_radius, h=thickness, $fn=cq);
     translate([0,0,-1]) cylinder(r=inner_radius, h=thickness + 2, $fn=cq);
  }
 }
}
*/