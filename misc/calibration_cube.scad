side = 20;
actual_x = 20.92;
actual_y = 20.62;
actual_z = 20.96;

x_scale = 1 + ((side - actual_x) / side);
y_scale = 1 + ((side - actual_y) / side);
z_scale = 1 + ((side - actual_z) / side);

echo("X scale: ", x_scale, " Y scale: ", y_scale, " Z scale: ", z_scale);

scale([x_scale, y_scale, z_scale])
 cube(size=[side, side, side]);
