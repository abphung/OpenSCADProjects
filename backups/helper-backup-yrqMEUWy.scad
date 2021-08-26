use <helper.scad>;

$fn = 180;

nailR = 1;
nailHeadR = 1;
nailL = 1;
nailHeadL = 1;
solenoidEndR = 4.5;
solenoidEndL = 1;
solenoidOuterR = 2.5;
solenoidInnerR = 1.6;
solenoidL = 22;

diff(){
    union(){
        cyl(solenoidEndL, solenoidEndR);
        cyl(solenoidL, solenoidOuterR);
        at(0, 0, solenoidL - solenoidEndL) cyl(solenoidEndL, solenoidEndR);
    }
    cyl(solenoidL, solenoidInnerR);
}