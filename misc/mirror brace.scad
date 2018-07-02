bracket_thickness = 2;
tube_length = bracket_thickness * 4;
tube_outer_radius = 9;
tube_thickness = 2;
tube_inner_radius = tube_outer_radius - tube_thickness;
$fn=25;

difference() {
    cube(size=[25, 15, 10]);
    translate([-1,-15,-10])
     rotate([35,0,0])
      #cube(size=[27,50,30]);
    
    translate([7,9,-1])
     #cylinder(r=2, h=12);
    
    translate([25-7,9,-1])
     #cylinder(r=2, h=12);
    
}