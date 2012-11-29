// Parametric end-cap
// Mark Reid
// Nov 29, 2012

// cylinder quality
cq = 100;

thickness = 3;
cap_diameter = 70;
outer_diameter = 60;
cap_height = 15;

cap_radius = cap_diameter / 2;
outer_radius = outer_diameter / 2;
inner_radius = outer_radius - thickness;

cylinder(r=cap_radius, h=thickness, $fn=cq);

translate([0,0,thickness])
 difference() {
   cylinder(r=outer_radius, h=cap_height, $fn=cq);
   cylinder(r=inner_radius, h=cap_height+1, $fn=cq);
 }
