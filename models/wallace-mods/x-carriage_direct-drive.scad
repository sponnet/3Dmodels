include <wallace2.scad>;

rotate([0,-90,90]) 
x_carriage2();

x_carriage_width = 30;
extruder_mount_hole_spacing = 50;
extruder_shift = extruder_mount_hole_spacing/2; // + bearing_size/2;

module x_carriage2() {

	difference(){
	
		union(){
	
			// Main mounting plate
			//cube([x_carriage_width,extruder_mount_hole_spacing+10,bearing_size/2]);

			// bearing holder
			translate([0,0,bearing_size/2 + 4]) rotate([0,90,0]){		
				translate([-bearing_size/2-4,-x_carriage_width/2,0]) cube([bearing_size + 8, x_rod_spacing+bearing_size/2+7,x_carriage_width]);
				for(side = [1, -1]) translate([0, side * x_rod_spacing / 2, 0]) cylinder(h=x_carriage_width,r=bearing_size/2 + 4, $fn = 60);
			}

			// mounting plate
			 

      // belt clip
      translate([0,-x_carriage_width/2-bearing_size/2-4-5-8-3,bearing_size/2+1]) cube([17,x_carriage_width,6]);
		}

     // Belt clip hole
     translate([(17-7)/2,-x_carriage_width/2-bearing_size/2-4-5-8-3+(17-7)/2,bearing_size/2+1/2]) cube([7,7,7]);
    
    // slice for clamping bearings
    translate([-x_carriage_width/2-1,-(x_carriage_width)/2,bearing_size/2+3 ]) cube([x_carriage_width*2+2,x_carriage_width,2]);
    
		
		translate([0,0,bearing_size / 2 + 4]) rotate([0,90,0]){
			
		// linear bearings
		translate([0, x_rod_spacing / 2, -x_carriage_width/2]) rotate([0, 0, 0]) {
			for(end = [0, 1]) mirror([0, end, 0]) translate([0, (end * x_carriage_width),-1 ]) cylinder(r = bearing_size / 2, h = x_carriage_width * 2 + 2, $fn = 30);
		}
		

		// screw holes for extruder mount
		//rotate([0,90,0]) translate([-x_carriage_width/2,extruder_shift+extruder_mount_hole_spacing/2,-bearing_size/2-4]) cylinder(r=2.1,h=bearing_size+8+1);
		for(side = [8, -8]) rotate([0,90,0]) translate([-x_carriage_width/2+side,extruder_shift-extruder_mount_hole_spacing/2,-bearing_size/2-4]) #cylinder(r=2.1,h=bearing_size+8+1);
		translate([0,26,0])for(side = [8, -8]) rotate([0,90,0]) translate([-x_carriage_width/2+side,extruder_shift-extruder_mount_hole_spacing/2,-bearing_size/2-4]) #cylinder(r=2.1,h=bearing_size+8+1);
		
	}	
	

	}
}