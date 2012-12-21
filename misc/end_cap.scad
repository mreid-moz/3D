// Parametric end-cap
// Mark Reid
// Nov 29, 2012

// cylinder quality
cq = 100;

cap_thickness = 2;
thickness = 3;
overhang = 5;
outer_diameter = 53;
cap_height = 10;

outer_radius = outer_diameter / 2;
cap_radius = outer_radius + overhang;
inner_radius = outer_radius - thickness;

cylinder(r=cap_radius, h=cap_thickness, $fn=cq);

translate([0,0,cap_thickness])
 difference() {
   cylinder(r=outer_radius, h=cap_height, $fn=cq);
   cylinder(r=inner_radius, h=cap_height+1, $fn=cq);
 }
