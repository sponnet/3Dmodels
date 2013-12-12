include <wallace2.scad>;

//base_end();

//translate([motor_casing+10,0,0]) 

base_end2();


module base_end2() difference() {

	// top plate & nema mount
	union(){
		linear_extrude(height = 4, convexity = 5) difference() {
			square([yz_motor_distance + motor_casing - motor_screw_spacing + 10, motor_casing + rod_size * 4], center = true);
			// nema motor arcs
			for(end = [1]) {
				// motor mount drills
				for(side = [1,-1]) translate([end * (yz_motor_distance + motor_casing - motor_screw_spacing) / 2, side * motor_screw_spacing / 2, 0]) {
					// We create a hull, because the NEMA screw spacing tend to be off on some motors.
					hull(){
						circle(m3_size * da6);
						translate([0,side*-1,0]) circle(m3_size * da6);
					}
				}
				translate([end * (yz_motor_distance + motor_casing) / 2, 0, 0]) #circle(motor_screw_spacing / 2);
			}
			// clamping holes for bearing retainer
			for(side = [1,-1]) translate([-1 * (yz_motor_distance + motor_casing - motor_screw_spacing) / 2+4, side * motor_screw_spacing / 2, 0]) square([4+1,10.5],center=true);

		}

		// stopswitch retainer
		mirror([0,1,0]) translate([-(yz_motor_distance + motor_casing - motor_screw_spacing + 10)/2-4,(motor_casing + rod_size * 4)/2-2,0]){
			difference(){
				translate([2,2,0])minkowski(){
					cube([16-4,10-3,2]);
					cylinder(r=2,h=1);
				}			
				translate([2,2,-1]) #cube([1.5,3.5,4]);
				translate([2+10,2,-1]) #cube([1.5,3.5,4]);
			}
		}
		
		// clamp for holding cables
		for(side = [0, 1]) mirror([0, side, 0]) 
		translate([(yz_motor_distance + motor_casing - motor_screw_spacing + 10)/2-16,(motor_casing + rod_size * 4)/2-2,0]){
			difference(){
					union(){
						cube([14,10,4]);
						translate([-1,10-2,0])cube([16,2,4]);
					}
					translate([7/2,0,-1])cube([7,11,4+2]);
			}
		}
		
		
		
		// X-rod retainer blocks
		translate([0,0,rod_size/2]){
			for(side = [1, -1]) translate([0, side * 0.5 *(motor_casing + rod_size * 4), 0]) rotate([90, 0, 90]) {
				translate([-rod_size*side,rod_size,]) 
					cube([rod_size*2,rod_size*2,yz_motor_distance + motor_casing - motor_screw_spacing + 10],center=true);
			}
		}

		// foot stand
		translate([yz_motor_distance / 2 - rod_size, 0, (end_height-motor_casing / 4)/2*1.2]) {
			cube([rod_size,motor_casing + rod_size * 4,(end_height-motor_casing / 4)*1.2],center=true);
		}

		// cylinder around Z-rods  	
		translate([yz_motor_distance / 2 - rod_size, 0, 0]) {
			cylinder(r=rod_size * da8 * 1.5, h=end_height-motor_casing / 4);
		}		


	// extra flesh around bottom of bearing retainers
	translate([-yz_motor_distance / 2 + bearing_size / 2, 0, -bearing_size * sqrt(2) / 4]) rotate([90, -45, 0]) {
		for(side = [0, 1]) mirror([0, 0, side]) translate([0, 0, rod_size / 2 + 8-1]) {
			difference(){
				cube([bearing_size / 2+2, bearing_size / 2+2, bearing_length+2]);
				cylinder(r = bearing_size / 2, h = bearing_length+2, center = false, $fn = 80);
			}
		}
	}



}
	
	// X-rod holes
	translate([0,0,rod_size/2]){
		for(side = [1, -1]) translate([0, side * 0.5 *(motor_casing + rod_size * 4), 0]) rotate([90, 0, 90]) {
			translate([-rod_size*side,rod_size,0])
				#cylinder(r = rod_size * da8 * .98 , h = yz_motor_distance + motor_casing + 20, center = true);
		}
	}

	// foot holes
	translate([0,0,rod_size/2]){
		for(side = [1, -1]) translate([0, side * 0.5 *(motor_casing), 0]) rotate([90, 0, 90]) {
			translate([-rod_size*side,15,0]) {
				hull(){
				#cylinder(r = 7.9, h = yz_motor_distance + motor_casing + 20, center = true);
				translate([side*(7.9-1),25,0])#cylinder(r = 1, h = yz_motor_distance + motor_casing + 20, center = true);
				}
			}
		}
	}

	// Z-rod holes
	translate([yz_motor_distance / 2 - rod_size, 0, 0]) {
		translate([0, 0, -2])  {
			rotate(180 / 8) #cylinder(r=rod_size * da8, h=end_height-motor_casing / 4, $fn = 8);
			translate([0, -rod_size / 4, 0]) #cube([rod_size * .6, rod_size / 2,end_height-motor_casing / 4]);
		}

	}
	
	
	// bearing retainers
	translate([-yz_motor_distance / 2 + bearing_size / 2, 0, -bearing_size * sqrt(2) / 4]) rotate([90, -45, 0]) {
//		%cylinder(r = rod_size * da8, h = 100, center = true, $fn = 8);
		for(side = [0, 1]) mirror([0, 0, side]) translate([0, 0, rod_size / 2 + 8]) {
			cylinder(r = bearing_size / 2, h = bearing_length, center = false, $fn = 80);
			cube([bearing_size / 2, bearing_size / 2, bearing_length]);
		}
	}

}


module base_end() difference() {
	linear_extrude(height = end_height, convexity = 5) difference() {
		square([yz_motor_distance + motor_casing - motor_screw_spacing + 10, motor_casing + rod_size * 4], center = true);
		// nema motor arcs
		for(end = [1, -1]) {
			for(side = [1, -1]) translate([end * (yz_motor_distance + motor_casing - motor_screw_spacing) / 2, side * motor_screw_spacing / 2, 0]) circle(m3_size * da6, $fn = 6);
			translate([end * (yz_motor_distance + motor_casing) / 2, 0, 0]) #circle(motor_screw_spacing / 2);
		}
	}
	for(end = [1, -1]) translate([end * (yz_motor_distance + motor_casing) / 2, 0, 3]) linear_extrude(height = end_height, convexity = 5) square(motor_casing, center = true);
	for(side = [1, -1]) translate([0, side * (motor_casing / 2 + rod_size), rod_size / 2 + bearing_size / 2]) rotate([90, 180 / 8, 90]) {
		cylinder(r = rod_size * da8, h = yz_motor_distance + motor_casing + 20, center = true, $fn = 8);
		%translate([0, 0, -70]) cylinder(r = rod_size * da8, h = 200, center = true, $fn = 8);
	}
	translate([0, 0, end_height]) scale([1, 1, .5]) rotate([90, 0, 90]) cylinder(r = motor_casing / 2, h = yz_motor_distance + 20, center = true);
	translate([yz_motor_distance / 2 - rod_size, 0, 0]) {
		translate([0, 0, -3]) linear_extrude(height = end_height - motor_casing / 4, convexity = 5) {
			rotate(180 / 8) circle(rod_size * da8, $fn = 8);
			translate([0, -rod_size / 4, 0]) square([rod_size * .6, rod_size / 2]);
		}

	}
	translate([-yz_motor_distance / 2 + bearing_size / 2, 0, -bearing_size * sqrt(2) / 4]) rotate([90, -45, 0]) {
		%cylinder(r = rod_size * da8, h = 100, center = true, $fn = 8);
		for(side = [0, 1]) mirror([0, 0, side]) translate([0, 0, rod_size / 2 + 8]) {
			cylinder(r = bearing_size / 2, h = bearing_length, center = false, $fn = 80);
			cube([bearing_size / 2, bearing_size / 2, bearing_length]);
		}
	}
	translate([0, 0, end_height - rod_size * 1.5]) rotate([90, 180 / 8, 0]) cylinder(r = rod_size * da8, h = motor_casing + rod_size * 5, $fn = 8, center = true);
	%translate([0, 0, end_height - rod_size * 1.5]) rotate([90, 180 / 8, 0]) cylinder(r = rod_size * da8, h = 100, $fn = 8, center = true);

}