
module ired_holder()
{
    segments1 = 100;
    body_main = 7.75;
    body_stop = 1.02;
    body_dia = 5;
    body_stop_dia = 6.1;
    length = body_main+body_stop;

    difference() {
        translate([-body_stop_dia/2-1,-length/2+0.2, 0  ]) cube(size=[body_stop_dia+2,length-2,body_stop_dia+1]);
        translate([0,-length/2,body_stop_dia/2+0.2]) rotate ([-90,0,0]) {
            union() {
            cylinder(h=length, d=body_dia, center=false, $fn=segments1 );
            cylinder(h=body_stop, d=body_stop_dia, center=false, $fn=segments1);
            translate([0,0,body_stop-0.2])cylinder(h=body_stop, d1=body_stop_dia-0.2, d2=body_dia-0.2, center=false, $fn=segments1);
            }
            
        }
    }
}

ired_holder();