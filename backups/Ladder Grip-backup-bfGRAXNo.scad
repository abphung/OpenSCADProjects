module at(x, y, z = 0){
    translate([x, y, z]) children();
}

module box(width, depth, height){
    cube([width, depth, height]);
}

module cyl(height, r, dir_x = 0, dir_y = 0, dir_z = 0){
    rotate([-90*dir_y, 90*dir_x, 90*dir_z]) cylinder(height, r, r);
}

module slice(angle1, angle2 = undef, y_off = 0, dir_x = 0, dir_y = 0, dir_z = 0){
    difference(){
        children();
        rotate([-90*dir_y, 90*dir_x, 90*dir_z]) rotate([0, 0, angle1]) translate([-200, 0, -200]) {
            cube([400, 200, 400]);
        }
        if (angle2 != undef){
            rotate([0, 0, angle2]) translate([-200, 0, -200]) {
                cube([400, 200, 400]);
            }
        }
    }
}

module extrude(height, points){
    linear_extrude(height) polygon(points = points);
}

function add_angle(additional_angle, point) = 
    let(new_angle = atan2(point[1], point[0]) + additional_angle)
        [norm(point)*cos(new_angle), norm(point)*sin(new_angle)];

module completion_extrude(height, points){
    last_point = points[len(points) - 1];
    last_point_angle = atan2(last_point[1], last_point[0]);
    a = [for (i = [0:last_point_angle:360 - last_point_angle], point = points) add_angle(i, point)];
    extrude(height, a);
}

function missing_leg(hypotenus, other_leg) = sqrt(pow(hypotenus, 2) - pow(other_leg, 2));

module diff(){
    difference(){
        children(0);
        children([1:$children - 1]);
    }
}

module squircle(height, r, p){
    echo([for (x = [-r:.1:r]) pow(pow(abs(x), p) - pow(r, p), 1/p), for (x = [-r:.1:r]) -pow(pow(abs(x), p) - pow(r, p), 1/p)])
    extrude(height, [for (x = [-r:.1:r]) pow(pow(abs(x), p) - pow(r, p), 1/p), for (x = [-r:.1:r]) -pow(pow(abs(x), p) - pow(r, p), 1/p)]);
}


squircle(10, 20, 2);
//completion_extrude(1, [[10, 0], [11*cos(5), 11*sin(5)], [10*cos(20), 10*sin(20)]]);
//extrude(1, for (i = [1:360] [cos(i), sin(i)]));
//slice(30, 180) cyl(20, 50);
//
//at(40, 40) box(12, 12, 12);
//
//diff(){
//    extrude(5, [[0, 0], [-10, 0], [-10, -10], [0, -10]]);
//    cyl(5, 10);
//}
//
//echo(missing_leg(5, 3));

