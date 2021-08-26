use <helper.scad>;

$fn = 120;
rotate([0, 0, 15]) rotate_extrude(angle = 330) at(6, -2.5) squircle2D(x = 1.5, y = 5);
at(-9.5, -.5) rotate([90, -90, 180])rotate_extrude(angle = 345) at(1.75) squircle2D(.75);