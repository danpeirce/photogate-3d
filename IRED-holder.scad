
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

module mount_peg()
{
    segments1 = 100;
    peg_len = 3;
    peg_d = 5;
    peg_canf_len = 1;
    peg_canf_d2 = 4.9;
    peg_canf_d1 = 3;
    
    difference()
    {
        union()
        {
            translate([0,0,-peg_len+.1])  {
                cylinder( h=peg_len, d=peg_d, $fn=segments1);
                translate([0,0,-peg_canf_len+0.1]) 
                {
                    cylinder( h=peg_canf_len, d1=peg_canf_d1, d2=peg_canf_d2, $fn=segments1);
                }
            }
        }
        translate([-peg_d/2,peg_d/2-peg_d/4,-peg_len-peg_canf_len+.1]) cube([peg_d+0.2, 2.0, peg_len+peg_canf_len]);
    }
}

union()
{
    ired_holder();
    mount_peg();
}
