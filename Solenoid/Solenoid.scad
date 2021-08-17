use <helper.scad>;

$fn = 180;
keep(xMax = 4.4) diff(){
    union(){
        cyl(1, 4.5);
        cyl(22, 2.5);
        at(0, 0, 21) cyl(1, 4.5);
    }
    cyl(22, 1.6);
}