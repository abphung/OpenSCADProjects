use <helper.scad>;

pull_up_h = 150;
pull_up_w = 170;
pull_up_r = 25.7/2;
support_a = 90 + atan2(-pull_up_h, pull_up_w);
ladder_w = 63.6;
ladder_w_w_cir = 69.6;
ladder_w_wo_cir = 30;
ladder_r = (ladder_w_w_cir - ladder_w_wo_cir)/2;
ladder_d = 53.3;
wall_thick = 3;
ladder_support_out_r = ladder_r + wall_thick;
ladder_thick = 3;
ladder_thick_support_out_r = ladder_thick/2 + wall_thick;
ladder_thick_x_off = -ladder_r + (ladder_w_w_cir - ladder_w + ladder_thick)/2;

pull_up_d = ladder_d + 2*wall_thick;
pull_up_y_off = -ladder_r - wall_thick;

support_h = (sqrt(2)/2 + 1)*pull_up_r + wall_thick + pull_up_h;

diff(){
    hull(){
        cyl(support_h, ladder_support_out_r);
        at(ladder_thick_x_off, ladder_d - ladder_r - ladder_thick/2) cyl(support_h, ladder_thick_support_out_r);
        //at(0, pull_up_y_off) box(pull_up_w + pull_up_r + wall_thick, pull_up_d, support_h);
        slice(dir_y = 1, 0) at(pull_up_w - ladder_r, pull_up_y_off, sqrt(2)/2*pull_up_r) cyl(dir_y = 1, pull_up_d, pull_up_r + wall_thick);
    }
    at(0, 0) cyl(support_h, ladder_r);
    at(ladder_w_wo_cir, 0) cyl(support_h, ladder_r);
    at(ladder_thick_x_off - ladder_thick/2, 0) box(ladder_w, ladder_d - ladder_r, support_h);
    at(ladder_thick_x_off + ladder_thick/2, 0) box(ladder_w - 2*ladder_thick, ladder_d - ladder_r + wall_thick, support_h);
    at(0, -ladder_r) box(ladder_w_wo_cir, ladder_r, support_h);
    at(pull_up_w - ladder_r, pull_up_y_off, sqrt(2)/2*pull_up_r) cyl(dir_y = 1, pull_up_d, pull_up_r);
}

