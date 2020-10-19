%color("white", 0.5) {include<base_plate.scad>;}  // base plate
%color("white", 0.5) {                            // top late
    translate([0,0,18.3]){
	    include<base_plate.scad>;
	}
}

color("black") {
    translate([7, 25, -0.2]) {
        rotate([0,-90, 180]) {
            import("IR_sensor_mount.STL"); 
		} 
	}
}

color("black") {
    translate([80, 12, -0.2]) {
        rotate([0,-90, 90]) {
            import("IRED_holder.STL"); 
		} 
	}
}

color("black") {
    translate([5, 76, -0.5]) {
        rotate([0,0, -90]) {
            import("junction_board_mount_mount.STL"); 
		} 
	}
}


/*
gap_x = 76.22 / 2;
inch = 25.4;
arm1_x = 44.59 / 2;
arm2_x = 44.60 / 2;
back_y = 50.60 / 2;
arm_y = 101.33/ 2;
total_x = arm1_x + gap_x + arm2_x;

fill_r = 4.71 / 2;
total_y = back_y + arm_y;
sensor_gx = 9.83 / 2;
sensor_gy = 8.88 / 2;
ired_gx = 9.27 / 2;
ired_gy = 8.27 / 2;
hole_d = 25.26 / 2;
hole_gy = 12.69 / 2;
hole_gx = 32.73 / 2;
junction_gx = 9.88 / 2;
junction_gy = 9.88 / 2;
post_gx = 14.38 / 2;
post_gy = 17.31 / 2;
thick = 6-1;
senser_hw = 12.86;
*/