socket_width = 19.25;
socket_length = 8.1;
socket_depth = 5;
socket_thickness = 1.5;
side_width = 10;
side_offset = (socket_width + 2*socket_thickness) - side_width + 2;

span_length = 175;

module socket(depth_offset) {
  difference() {
    cube(size=[socket_width + socket_thickness * 2,
               socket_length + socket_thickness * 2,
               socket_depth + socket_thickness]);
    translate([socket_thickness, socket_thickness, depth_offset])
      #cube(size=[socket_width, socket_length, socket_depth]);
  }
}

rotate([90,0,45]) {
socket(0);
translate([0,0,span_length + socket_depth]) socket(socket_thickness);

difference() {
  translate([side_offset,0,socket_depth]) cube(size=[side_width, socket_thickness, span_length]);
  translate([side_offset + side_width/2,2.5,socket_depth + (span_length/3)]) rotate([90,0,0]) #cylinder(r=2, h=5, $fn=30);
  translate([side_offset + side_width/2,2.5,socket_depth + ((span_length/3)*2)]) rotate([90,0,0]) #cylinder(r=2, h=5, $fn=30);
}
}
