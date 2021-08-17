use <helper.scad>;

boardH = 1.5;
totalH = 7.2;
peepR = 15/2;
peepH = 2.2;
camSideL = 9.1;
boardW = 25;
boardD = 24.1;
camDOff = 17.3;
thick = 1;
camTipH = 1.8;
peiceH = totalH - boardH + peepH - camTipH;

diff(){
    at(0, -thick) squircle(peiceH, boardW/2);
    at((boardW - camSideL)/2) box(camSideL, camDOff, peiceH);
    at(boardW/2, camDOff - camSideL/2) cyl(peepH, peepR);
}