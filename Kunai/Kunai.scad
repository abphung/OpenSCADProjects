use <helper.scad>;

zAngle = 30;
$fn = 60;
handleZ = 9.8;
handleH = 5;

scale([1.2, 1.2, 1.2]) keep(zMin = 0, yMax = .9) union(){
    diff(){
        scale([1, .4, 2]) sphere(5);
        at(0, 4) scale([1.7, 1.4, 2]) sphere(4.8);
        at(0, -4) scale([1.7, 1.4, 2]) sphere(4.8);
    }
    intersection(){
        scale([1, .4, 2]) sphere(5);
        scale([1.25, 1, 1]) cylinder(29.6, 0, 4, $fn = 6);
    }
    up(handleZ) cyl(2, .45);
    up(handleZ + .3) cyl(handleH + 1, .6);
    up(handleZ + .6) cyl(2, .75);
    up(handleZ + .9) cyl(handleH, .9);
    up(handleZ + handleH + 2.75) rotate([90, 0, 0]) rotate_extrude() at(1.4) circle(.3);
}