tube_thickness = 1.9;
cylinder_quality = 50;

inner_diameter = 18;
outer_diameter = inner_diameter + (tube_thickness * 2);
rad_out = outer_diameter / 2;
rad_in = inner_diameter / 2;
hi = 15;

union() {
difference()
{
   cylinder(r = rad_out,h = hi, $fn=cylinder_quality);
   translate([0,0,-0.1])	cylinder(r = rad_in, h =hi + 0.2);
}

difference() {
  translate([0,0,hi])
    cylinder(r1=rad_out, r2=0, h=15);
  translate([0,0,hi])
    cylinder(r1=rad_in, r2=0, h=11);
}   
}