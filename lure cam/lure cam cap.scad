tube_thickness = 2;
cylinder_quality = 50;

outer_diameter = 20;
inner_diameter = outer_diameter - tube_thickness;
rad_out = outer_diameter / 2;
rad_in = inner_diameter / 2;
hi = 15;

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
