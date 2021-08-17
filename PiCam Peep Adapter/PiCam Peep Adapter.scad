use <helper.scad>;

boardH = 1.5;
totalH = 7.2;
peepR = 14.75/2;
peepH = 2.2;
camSideL = 9.1;
boardW = 25;
boardD = 24.1;
camDOff = 17.3;
thick = 1;
camTipH = 1.8;
peiceH = totalH - boardH + peepH - camTipH;
tabProtrusionD = 15;
tabProtrusionDOff = thick;
tabProtrusionH = 1;

at(0, -tabProtrusionD + tabProtrusionDOff) squircle(tabProtrusionH, x = boardW + 2*thick, y = tabProtrusionD);
at(0, boardW + 2*thick - tabProtrusionDOff) squircle(tabProtrusionH, x = boardW + 2*thick, y = tabProtrusionD);
at(thick, thick) diff(){
    at(-thick, -thick) squircle(peiceH, boardW + 2*thick);
    at((boardW - camSideL)/2) box(camSideL, camDOff, peiceH);
    at(boardW/2, camDOff - camSideL/2) cyl(peepH, peepR); 
    
    at(-thick, 0) box((boardW - 2*peepR)/2, boardW, thick);
    at(thick + (boardW + 2*peepR)/2, 0) box((boardW - 2*peepR)/2, boardW, thick);
}