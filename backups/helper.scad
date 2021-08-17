module box_at(width, depth, height, x, y, z){
    translate([x, y, z]) cube([width, depth, height]);
}

module box(width, depth, height){
    cube([width, depth, height]);
}

module cyl_at(height, r, x, y, z, dir_x = 0, dir_y = 0, dir_z = 0){
    translate([x, y, z]) rotate([-90*dir_y, 90*dir_x, 90*dir_z]) cylinder(height, r, r);
}

module cyl(height, r, dir_x = 0, dir_y = 0, dir_z = 0){
    rotate([-90*dir_y, 90*dir_x, 90*dir_z]) cylinder(height, r, r);
}