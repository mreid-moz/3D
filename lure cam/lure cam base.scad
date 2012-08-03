tube_height=80;
tube_inner_diameter=15;
tube_inner_radius = tube_inner_diameter / 2;
tube_thickness = 2;
tube_outer_radius=tube_inner_radius + tube_thickness;
cylinder_quality=50;
base_inset_radius=tube_inner_radius - tube_thickness;

union() {
difference() {
  cylinder (h=tube_height, r=tube_outer_radius, center=false, $fn=cylinder_quality);
  cylinder (h=tube_height, r=tube_inner_radius, center=false, $fn=cylinder_quality);
}
difference() {
  cylinder (h=tube_thickness, r=tube_outer_radius, center=false, $fn=cylinder_quality);
  cylinder (h=tube_thickness, r=base_inset_radius, center=false, $fn=cylinder_quality);
}

}


 f=8.75;
 fe=f+10;
 fh=30;

module fletch()
{
 color("blue") {
 polyhedron ( points = [[f, 0, 0], [f, tube_thickness, 0], [fe, tube_thickness, 0], 
                        [fe, 0, 0], [f, 0, fh], [f, tube_thickness, fh]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4]
  ]);
 }
}

fletch();
rotate ([0,0,90]) fletch();
rotate ([0,0,180]) fletch();
rotate ([0,0,270]) fletch();

// Draw mini-fletch
mf_top=tube_height-15;
mf_bottom=mf_top-10;

polyhedron ( points = [[f, 0, mf_bottom], [f, tube_thickness, mf_bottom], [f+5, tube_thickness, mf_bottom], 
                        [f+5, 0, mf_bottom], [f, 0, mf_top], [f, tube_thickness, mf_top]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4]
  ]);

polyhedron ( points = [[f, 0, mf_bottom-10], [f, tube_thickness, mf_bottom-10], [f+5, tube_thickness, mf_bottom], 
                        [f+5, 0, mf_bottom], [f, 0, mf_top], [f, tube_thickness, mf_top]], 
              triangles = [[0,2,1], [0,3,2],  [0,4,3], [1,2,5],
                           [2,4,5], [2,3,4]
  ]);