tile_width         = 77;
//tile_width         = 7;
tile_height        = 113 - 4; // correct for laziness (ie. lack of accuracy)
tile_thickness     = 15.5;
tile_lip_thickness = 7.4;
tile_lip_depth     = 4.7;

width_padding      = 5;
height_padding     = 7;
thickness_padding  = 2.5;

module tile() {
 difference() {
  color("red") cube(size=[tile_width, tile_height, tile_thickness], center=true);
  translate([0, tile_height / 2 - tile_lip_depth / 2, tile_lip_thickness / 2])
   cube(size=[tile_width + 2, tile_lip_depth + 1, (tile_thickness - tile_lip_thickness + 1)], center=true);
  translate([0, -tile_height/2 + tile_lip_depth / 2, tile_lip_thickness / 2])
   cube(size=[tile_width + 2, tile_lip_depth + 1, (tile_thickness - tile_lip_thickness + 1)], center=true);
 }
}

//translate([width_padding / 2 - 0.5, height_padding / 2,thickness_padding / 2 + 1]) {
// tile();
// translate([tile_width + 1, 0, 0]) tile();
//}

outer_width = tile_width * 2 + width_padding * 2;
outer_height = tile_height + height_padding * 2;
outer_thickness = tile_thickness + thickness_padding * 2;
drainage_offset = outer_width / 6;
xs1 = tile_width * 2 + width_padding + 2;
ys1 = tile_height + 2;

grille_rows = 11;
grille_cols = 8;
grille_spacing = 12;
grille_rad = 4;
grille_xoff = (outer_width - (grille_rows * (grille_spacing))) / 2;
grille_yoff = (outer_height - (grille_cols * (grille_spacing))) / 2;

module body() {
 difference() {
  // Main body:
  cube(size=[outer_width, outer_height, outer_thickness], center=true);

  // Tile spaces:
  translate([-width_padding/2,0, -thickness_padding]) {
   cube(size=[xs1, ys1, tile_lip_thickness + 2], center=true);
   translate([0, 0, tile_lip_thickness + 2 - 1])
    cube(size=[xs1, ys1 - tile_lip_depth * 2 - 2, tile_lip_thickness + 2], center=true);
  }

  // Mounting holes:
  translate([0,-tile_height/2 - thickness_padding,-outer_thickness/2-1]) {
   cylinder(r=2.5, h = outer_thickness + 2, $fn=30);
   translate([0,0,outer_thickness - 3])
    cylinder(r1=0, r2=10, h = outer_thickness/2, $fn=30);
  }
  translate([0,tile_height/2 + thickness_padding,-outer_thickness/2-1]) {
   cylinder(r=2.5, h = outer_thickness + 2, $fn=30);
   translate([0,0,outer_thickness - 3])
    cylinder(r1=0, r2=10, h = outer_thickness/2, $fn=30);
  }


  // Drainage holes:
  translate([-drainage_offset, -outer_height / 2-1, -thickness_padding - tile_lip_thickness / 4]) {
   cube(size=[3, height_padding + 2, 3]);
   translate([-drainage_offset, 0, 0])
    cube(size=[3, height_padding + 2, 3]);
   translate([drainage_offset * 3, 0, 0])
    cube(size=[3, height_padding + 2, 3]);
   translate([drainage_offset * 2, 0, 0])
    cube(size=[3, height_padding + 2, 3]);
  }

  // Grille:
  translate([-outer_width/2 + grille_xoff, 0, 0]) {
   for ( row = [0 : grille_rows] ) {
     translate([row * grille_spacing, 0, 0])
      #cube(size=[grille_rad * 2, grille_cols * (grille_spacing), outer_thickness + 2], center=true);
   }
  }
 }
}

module end_cap() {
  cube(size=[width_padding, tile_height + 0.5, tile_lip_thickness + 1], center = true);
  translate([0, 0, tile_lip_thickness])
   cube(size=[width_padding, tile_height - (2 * tile_lip_depth) - 1, tile_thickness - tile_lip_thickness + 3], center = true);
}

// Print out a small slice for size-testing.
module test() {
 difference() {
  body();
  translate([-35, 0, 0])
   cube(size=[outer_width - 50,outer_height + 10,outer_thickness + 10], center=true);
  translate([outer_width / 2 + 10, 0, 0])
   cube(size=[outer_width - 50,outer_height + 10,outer_thickness + 10], center=true);
 }
}


//translate([outer_width / 2 - 2, 10, -thickness_padding])
 end_cap();

//body();
//translate([-tile_width, 0, 1]) tile();

//test();
