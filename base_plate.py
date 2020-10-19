from solid import *
from solid.utils import *

SEGMENTS = 48
# Transparent = (1,    1,    1,   0.5)

def baseplate():
    gap_x = 76.22 / 2
    inch = 25.4
    arm1_x = 44.59 / 2
    arm2_x = 44.60 /2
    back_y = 50.60 /2
    arm_y = 101.33/2
    total_x = arm1_x + gap_x + arm2_x
    
    fill_r = 4.71 /2
    total_y = back_y + arm_y
    sensor_gx = 9.83 / 2
    sensor_gy = 8.88 /2
    ired_gx = 9.27 / 2
    ired_gy = 8.27 /2
    hole_d = 25.26 /2
    hole_gy = 12.69 /2
    hole_gx = 32.73 / 2
    junction_gx = 9.88 / 2
    junction_gy = 9.88 /2
    post_gx = 14.38 / 2
    post_gy = 17.31 /2
    thick = 6-0.5
    sensor_hw = 12.86/2
    junction_hw = 12.86/2
    ired_hw = 12.86/2
    
    # gap_remove = cube([gap_x, arm_y, thick+1])
    gap_remove = hull()( translate([arm1_x+fill_r,-fill_r,-0.5])(cylinder(r=fill_r, h= thick+1, center=False)),
                         translate([arm1_x+gap_x-fill_r, -fill_r,-0.5])(cylinder(r=fill_r, h= thick+1, center=False)),
                         translate([arm1_x+fill_r,arm_y-fill_r,-0.5])(cylinder(r=fill_r, h= thick+1, center=False)),
                         translate([arm1_x+gap_x-fill_r, arm_y-fill_r,-0.5])(cylinder(r=fill_r, h= thick+1, center=False))  )
                         
    body = cube([total_x, total_y, thick])
    led_hole = translate([hole_gx+hole_d/2, total_y-hole_gy-hole_d/2 , -0.5])(cylinder(d = hole_d, h = thick+1, center=False))
    sensor_hole = translate([arm1_x-sensor_hw-sensor_gx, sensor_gy, -.05])(cube([sensor_hw, sensor_hw, 6+1]))
    junction_hole = translate([junction_gx, total_y - junction_gy - junction_hw, -.05])(cube([sensor_hw, sensor_hw, 6+1]))
    ired_hole = translate([total_x-arm2_x+ired_gx, sensor_gy, -.05])(cube([sensor_hw, sensor_hw, 6+1]))
    
    body_mod = body - gap_remove - led_hole - sensor_hole - junction_hole - ired_hole
    return body_mod
    
if __name__ == '__main__':
    a = color(Transparent)(baseplate()) 
    scad_render_to_file(a, file_header=f'$fn = {SEGMENTS};', include_orig_code=True)