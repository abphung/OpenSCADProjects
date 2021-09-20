use <helper.scad>;
use <MCAD/nuts_and_bolts.scad>

$fn = 180;

nailR = 1;
nailHeadR = 1;
nailL = 1;
nailHeadL = 1;
solenoidEndR = 5.5;
solenoidEndL = 2;
solenoidOuterR = 2.5;
solenoidInnerR = 1.6;
solenoidL = 24;
off = -1;
buf = 2;

diff(){   
    union(){
        up(solenoidEndR) rotate([-90, 0, 0]) cyl(solenoidL, solenoidOuterR);
        hull(){
            at(0, solenoidL - solenoidEndL, solenoidEndR) cyl(solenoidEndL, solenoidEndR, dir_y = 1);
            at(-3*solenoidEndR, solenoidL - solenoidEndL + solenoidEndR) cyl(solenoidEndL, solenoidEndR);
        }
        hull(){
            at(0, solenoidL - solenoidEndL, solenoidEndR) cyl(solenoidEndL, solenoidEndR, dir_y = 1);
            at(3*solenoidEndR, solenoidL - solenoidEndL + solenoidEndR) cyl(solenoidEndL, solenoidEndR);
        }
        hull(){
            up(solenoidEndR) cyl(solenoidEndL, solenoidEndR, dir_y = 1);           
            at(-3*solenoidEndR, solenoidEndL - solenoidEndR) cyl(solenoidEndL, solenoidEndR);
        }
        hull(){
            up(solenoidEndR) cyl(solenoidEndL, solenoidEndR, dir_y = 1);
            at(3*solenoidEndR, solenoidEndL - solenoidEndR) cyl(solenoidEndL, solenoidEndR);
        }
    }
    up(solenoidEndR) rotate([-90, 0, 0]) up(-100) cyl(1000, solenoidInnerR);
    at(-3*solenoidEndR, solenoidL - solenoidEndL + solenoidEndR, solenoidEndL + 10) boltHole(3, units="MM", length= 30);
    at(3*solenoidEndR, solenoidL - solenoidEndL + solenoidEndR) boltHole(3, units="MM", length= 30);
    at(-3*solenoidEndR, solenoidEndL - solenoidEndR) boltHole(3, units="MM", length= 30);
    at(3*solenoidEndR, solenoidEndL - solenoidEndR) boltHole(3, units="MM", length= 30);
}
at(-3*solenoidEndR, solenoidL - solenoidEndL + solenoidEndR, solenoidEndL) bolt(3, units="MM", length= 30)
diff(){
    rotate([0, 0, -135]) box(solenoidL/sqrt(2), solenoidL/sqrt(2), solenoidEndL);
    at(0, -sqrt(2)/2, off) rotate([0, 0, -135]) box(solenoidL/sqrt(2) - 1, solenoidL/sqrt(2) - 1, solenoidEndL + buf);
}

