tile_width         = 77;
//tile_width         = 7;
tile_height        = 113;
tile_thickness     = 15.5;
tile_lip_thickness = 7.4;
tile_lip_depth     = 4.7;

width_padding      = 15;
height_padding     = 15;
thickness_padding  = 5;

module tile() {
 difference() {
  color("red") cube(size=[tile_width, tile_height, tile_thickness]);
  translate([-1, 0, tile_lip_thickness]) {
   translate([0, -1, 0])
    cube(size=[tile_width + 2, tile_lip_depth + 1, (tile_thickness - tile_lip_thickness + 1)]);
   translate([0, tile_height - tile_lip_depth, 0])
    cube(size=[tile_width + 2, tile_lip_depth + 1, (tile_thickness - tile_lip_thickness + 1)]);
  }
 }
}

//translate([width_padding / 2 - 0.5, height_padding / 2,thickness_padding / 2 + 1]) {
// tile();
// translate([tile_width + 1, 0, 0]) tile();
//}

module centred_xy_cube(xc, yc, xs, ys, zs) {
 centred_cube(xc, yc, zs/2, xs, ys, zs);
}

module centred_cube(xc, yc, zc, xs, ys, zs) {
 translate([xc, yc, zc])
  translate([-xs/2, -ys/2, -zs/2])
   cube(size=[xs, ys, zs]);
}

outer_width = tile_width * 2 + width_padding;
outer_height = tile_height + height_padding;
outer_thickness = tile_thickness + thickness_padding;
drainage_offset = outer_width / 6;
difference() {
 cube(size=[outer_width, outer_height, outer_thickness]);
 translate([-1, height_padding / 2 - 1,thickness_padding / 2]) {
  #cube(size=[tile_width * 2 + (width_padding / 2) + 2, tile_height + 2, tile_lip_thickness + 2]);
  translate([0,tile_lip_depth,tile_lip_thickness + 2])
   #cube(size=[tile_width * 2 + (width_padding / 2) + 2, tile_height + 2 - tile_lip_depth * 2, tile_lip_thickness + 2]);
 }
 translate([outer_width / 2,height_padding / 4 + 1,-1])
  #cylinder(r=2.5, h = outer_thickness + 2, $fn=30);
 translate([outer_width / 2,outer_height - (height_padding / 4) - 1,-1])
  #cylinder(r=2.5, h = outer_thickness + 2, $fn=30);
 

 translate([drainage_offset, -1, thickness_padding / 2 + tile_lip_thickness / 2]) {
  cube(size=[3, 20, 3]);
  translate([drainage_offset, 0, 0])
   cube(size=[3, 20, 3]);
  translate([drainage_offset * 3, 0, 0])
   cube(size=[3, 20, 3]);
  translate([drainage_offset * 4, 0, 0])
   cube(size=[3, 20, 3]);
 }
}

//translate([0,height_padding/2 - 1,(thickness_padding / 2) + tile_lip_thickness + 2])
// cube(size=[outer_width,tile_lip_depth,outer_thickness - (thickness_padding / 2) - tile_lip_thickness - 2]);
//translate([0,outer_height - (height_padding/2) - tile_lip_depth + 1,(thickness_padding / 2) + tile_lip_thickness + 2])
// cube(size=[outer_width,tile_lip_depth + 2,outer_thickness - (thickness_padding / 2) - tile_lip_thickness - 2]);

module end_cap() {
  cube(size=[width_padding / 2 - 2, tile_height + 2, tile_lip_thickness + 2]);
  translate([0, tile_lip_depth, tile_lip_thickness + 2])
   cube(size=[width_padding / 2 - 1, tile_height - (2 * tile_lip_depth), tile_thickness - tile_lip_thickness + 3]);
}

//translate([-20, height_padding / 2, thickness_padding / 2]) {
//translate([-20, 0, 0]) {
// end_cap();
//}
