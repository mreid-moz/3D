tube_height=70;
tube_inner_diameter=15;
tube_inner_radius = tube_inner_diameter / 2;
tube_thickness = 1.95;
tube_outer_radius=tube_inner_radius + tube_thickness;
cylinder_quality=40;
base_inset_radius=tube_inner_radius + 1;
base_inset_depth=2;


line_guide_outer = 2;
line_guide_inner = 1.2;

 f=9.1;
 fe=f+10;
 fh=30;
 z = 0;

module fletch()
{
 color("blue") {
 translate([0,-1,0]) polyhedron ( points = [[f, z, z], [f, tube_thickness, z], [fe, tube_thickness, z], 
                        [fe, z, z], [f, z, fh], [f, tube_thickness, fh]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4], [0,1,5], [0,5,4]
  ]);
 }
}


difference() {
  cylinder (h=tube_height+10, r=tube_outer_radius, center=false, $fn=cylinder_quality);
  translate([0,0,-1]) cylinder (h=tube_height+12, r=tube_inner_radius, center=false, $fn=cylinder_quality);
  translate([0,0,-1]) cylinder (h=base_inset_depth, r=base_inset_radius, center=false, $fn=cylinder_quality);
}


difference() {
 fletch();
 translate([tube_outer_radius+line_guide_outer-1.5,0,-0.5]) cylinder(h=fh+1, r=line_guide_inner, $fn=cylinder_quality);
}

rotate ([0,0,90]) fletch();
rotate ([0,0,180]) fletch();
rotate ([0,0,270]) fletch();


mf_top=tube_height-3;
mf_bottom=mf_top-8;

// Draw mini-fletch
module mini_fletch() {

translate([0,-1,0]) {
 polyhedron (points = [[f, 0, mf_bottom], [f, tube_thickness, mf_bottom], [f+5, tube_thickness, mf_bottom], 
                        [f+5, 0, mf_bottom], [f, 0, mf_top], [f, tube_thickness, mf_top]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4], [0,1,5], [0,5,4]
  ]);


 polyhedron ( points = [[f, 0, mf_bottom-8], [f, tube_thickness, mf_bottom-8], [f+5, tube_thickness, mf_bottom], 
                        [f+5, 0, mf_bottom], [f, 0, mf_top], [f, tube_thickness, mf_top]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4], [0,1,5], [0,5,4]
  ]);

}
}

/*
difference() {
 mini_fletch();
 translate([tube_outer_radius+line_guide_outer-1.5,0,mf_bottom-15]) cylinder(h=fh, r=line_guide_inner, $fn=cylinder_quality);

}
*/

difference() {
 translate([tube_outer_radius+line_guide_outer-1.5,0,0])
  cylinder(h=tube_height, r=line_guide_outer, $fn=cylinder_quality);

 translate([tube_outer_radius+line_guide_outer-1.5,0,-1])
  cylinder(h=tube_height+2, r=line_guide_inner, $fn=cylinder_quality);
 translate([0,0,-1]) cylinder (h=base_inset_depth, r=base_inset_radius, center=false, $fn=cylinder_quality);
}

