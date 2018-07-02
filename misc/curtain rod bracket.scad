bracket_thickness = 2;
tube_length = bracket_thickness * 4;
tube_outer_radius = 9;
tube_thickness = 2;
tube_inner_radius = tube_outer_radius - tube_thickness;
$fn=25;

module brace() {
    translate([9,12.5 - bracket_thickness/2,0])
        polyhedron(
            points=[
                [0,0,0],
                [7,0,0],
                [7,bracket_thickness,0],
                [0,bracket_thickness,0],
                [7,bracket_thickness,tube_length],
                [7,0,tube_length]
            ],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
        );
}

module backer() {
    cube(size=[25,25,bracket_thickness]);
    translate([25,12.5,0])
        cylinder(r=tube_outer_radius, h=tube_length);
    brace();
}

difference() {
    backer();
    translate([25,12.5,-1]) #cylinder(r=tube_inner_radius, h=tube_length + 2);
    translate([25,0,-1]) #cube(size=[10,25,tube_length + 2]);
    translate([15,5,-1]) #cylinder(r=bracket_thickness, h=bracket_thickness + 2);
    translate([15,20,-1]) #cylinder(r=bracket_thickness, h=bracket_thickness + 2);
    translate([5,12.5,-1]) #cylinder(r=bracket_thickness, h=bracket_thickness + 2);
}