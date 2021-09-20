use <helper.scad>;

$fn = 30;
module cutout(h, r){
    extrude(h, [for (i = [1:2:360]) [(r + 3*sin(3*i))*cos(i), (r + 3*sin(3*i))*sin(i)]]);
}

//diff(){
//    union(){
//        diff(){
//            cyl(3, 30);
//            up(1) cutout(3, 16);
//            
//        }
//        up(1) cutout(2, 14);
//    }
//    cyl(4, 1);
//}

at(0, 70) {
    diff(){
        at(-35, -25) box(70, 50, 4);
        up(1) cyl(4, 30.5);
    }
    at(34) cyl(6, 1);
    cyl(4, 1);
}

at(0, 140) diff(){
    union(){
        slice(0, 30) cyl(2, 69);
        cyl(2, 3);
        at(34*cos(15), 34*sin(15)) cyl(4, 1);
    }
    cyl(3, 1.5);
}