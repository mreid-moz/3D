// Fly Rod repair
// Mark Reid
// June 1, 2013

// cylinder quality
cq = 40;

inner_diam_top = 2.27;
inner_diam_bot = 1.65;
thickness = 1;
brace_height = 25;

top_offset = 5;

scale_factor = 1.5;

inner_radius_top = (inner_diam_top / 2) * scale_factor;
inner_radius_bot = (inner_diam_bot / 2) * scale_factor;
outer_radius = inner_radius_top + thickness;

module thingy() {
 difference() {
  translate([0,0,0])
   cylinder(r=outer_radius, h=brace_height, $fn=cq);
  translate([0,0,(brace_height / 2) + thickness])
   #cylinder(r1=inner_radius_bot, r2=inner_radius_top, h=brace_height/2 - thickness, $fn=cq);
  translate([0,0,-thickness])
   #cylinder(r=inner_radius_bot, h=brace_height/2, $fn=cq);
 }
}

rotate([0,90,0])
difference() {
 thingy();
 translate([0,-50, -1]) cube([100,100,100]);
}
