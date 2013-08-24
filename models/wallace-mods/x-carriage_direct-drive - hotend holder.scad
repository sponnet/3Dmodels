include <wallace2.scad>;

gNema17MountDiagonal = 43;
mountHoleRadius = 3/2*1.1;
mountRadius = gNema17MountDiagonal/2;
shaftcollarradius = 11.5;

x_carriage2();

plate_w = 30;
plate_h = 40;
plate_d = 4;

deltay = 4;
//extruder_mount_hole_spacing = 50;
//extruder_shift = extruder_mount_hole_spacing/2; // + bearing_size/2;

module x_carriage2() {

	difference(){
	
		// base plate
		translate([0,0,0]) rotate([0,0,0]){		
			translate([0,0*-plate_w/2,0]) cube([plate_w, plate_h,plate_d]);
		}

    	translate([(plate_w-16)/2,deltay,0]) rotate([0,90,0]){
			// screw holes for extruder mount
			for(ty = [0, 16]) for(tx = [0, -16]) rotate([0,90,0])
			translate([tx,ty,-plate_d-1]) 
			#cylinder(r=2.1,h=plate_d+2);
			//translate([0,26,0])for(tx = [8, -8]) rotate([0,90,0]) translate([-plate_w/2+side,extruder_shift-extruder_mount_hole_spacing/2,-bearing_size/2-4]) #cylinder(r=2.1,h=bearing_size+8+1);
			
		}

		/*
			// Create the mounting holes
			rotate([90,0,0])
			for(hole=[0:3])
			{
				rotate([0,0,(hole*90)+45])
				translate([mountRadius, 0, 0])
				#cylinder(r=mountHoleRadius, h=3, center=false, $fn=12);
			}
*/

		
	}
}