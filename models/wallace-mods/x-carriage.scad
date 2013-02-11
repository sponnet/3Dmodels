include <wallace2.scad>;

rotate([0,0,90]) x_carriage2();

x_carriage_width = 30;
extruder_mount_hole_spacing = 50;
extruder_shift = extruder_mount_hole_spacing/2 + bearing_size/2 - 2;

module x_carriage2() {

	difference(){
		union(){
	
			// Main mounting plate
			cube([x_carriage_width,extruder_mount_hole_spacing+10,bearing_size/2]);

			// Side flange
			hull(){
				translate([x_carriage_width-4,0,bearing_size / 2 +4 ]) rotate([0,90,0]) translate([0, x_rod_spacing / 2, 0]) #cylinder(r=bearing_size / 2 + 4,h=4,$fn = 30);
				translate([x_carriage_width-4,bearing_size/2+1+extruder_mount_hole_spacing ,0]) #cube([4,1,bearing_size/2]);
			}
			
			// bearing holder
			translate([0,0,bearing_size / 2 + 4]) rotate([0,90,0]){
		
				union(){
					linear_extrude(height = x_carriage_width, convexity = 5) 

					union() {
						square([bearing_size + 8, x_rod_spacing], center = true);
						for(side = [1, -1]) translate([0, side * x_rod_spacing / 2, 0]) circle(bearing_size / 2 + 4, $fn = 30);
					}
				}
			}
		}

		translate([0,0,bearing_size / 2 + 4]) rotate([0,90,0]){
			
		// linear bearings
		translate([0, x_rod_spacing / 2, 0]) rotate([0, 0, 0]) {
			//%translate([0, 0, 20]) rotate(180 / 8) cylinder(r = rod_size * da8, h = 200, center = true, $fn = 8);
			for(end = [0, 1]) mirror([0, end, 0]) translate([0, (end * x_carriage_width),-1 ]) #cylinder(r = bearing_size / 2, h = x_carriage_width + 2, $fn = 30);
		}
		
		// extruder hole
		hull(){
			rotate([0,90,0]) translate([-x_carriage_width/2,extruder_shift,-bearing_size/2-4]) #cylinder(r=8+.5,h=bearing_size+8+1);
			rotate([0,90,0]) translate([-x_carriage_width/2+20,extruder_shift+5,-bearing_size/2-4]) #cylinder(r=8+.5,h=bearing_size+8+1);
		}

		// screw holes
		rotate([0,90,0]) translate([-x_carriage_width/2,extruder_shift+extruder_mount_hole_spacing/2,-bearing_size/2-4]) #cylinder(r=2.1,h=bearing_size+8+1);
		rotate([0,90,0]) translate([-x_carriage_width/2,extruder_shift-extruder_mount_hole_spacing/2,-bearing_size/2-4]) #cylinder(r=2.1,h=bearing_size+8+1);
		
	}	
	

	}
}