// To use
// use <helper.scad>;
use <MCAD/nuts_and_bolts.scad>

module at(x, y = 0, z = 0){
    translate([x, y, z]) children();
}

module box(width, depth, height){
    cube([width, depth, height]);
}

module cyl(height, r, dir_x = 0, dir_y = 0, dir_z = 0){
    rotate([-90*dir_y, 90*dir_x, 90*dir_z]) cylinder(height, r, r);
}

module slice(angleMin = 0, angleMax = 360, dir_x = 0, dir_y = 0, dir_z = 0){
    intersection(){
        rotate([-90*dir_y, 90*dir_x, 90*dir_z]) up(-1000) extrude(2000, [[0,0], [1000*cos(angleMin), 1000*sin(angleMin)], [1000*cos(angleMax), 1000*sin(angleMax)]]);
        children();
    }
}

module keep(xMax = 1000, xMin = -1000, yMax = 1000, yMin = -1000, zMax = 1000, zMin = -1000){
    intersection(){
        at(xMin, yMin, zMin) box(xMax - xMin, yMax - yMin, zMax - zMin);
        children();
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

module squircle(height, r = 1, x = 1, y = 1, p = 5, steps=100){
    scale([x/2, y/2, 1]) at(r, r) extrude(height, [for (x = [-r:r/steps*2:r]) [x, pow(pow(r, p) - pow(abs(x), p), 1/p)], for (x = [-r:r/steps*2:r]) [x, -pow(pow(r, p) - pow(abs(x), p), 1/p)]]);
}

module squircle2D(r = 1, x = 1, y = 1, p = 5, steps=100){
    scale([x/2, y/2, 1]) at(r, r) polygon(points = [for (x = [-r:r/steps*2:r]) [x, pow(pow(r, p) - pow(abs(x), p), 1/p)], for (x = [-r:r/steps*2:r]) [x, -pow(pow(r, p) - pow(abs(x), p), 1/p)]]);
}

module pyramid(height, r, sides, upsidedown = false){
    cylinder(height, upsidedown ? 0 : r, upsidedown ? r : 0, $fn = sides);
}

module up(z){
    at(0, 0, z) children();
}

module bolt(size, units="MM", length, tolerance = +0.0001, proj = -1){
    mirror([0, 0, 1]) boltHole(size, units = units, length = length, tolerance = tolerance, proj = proj);
}