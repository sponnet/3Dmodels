include <wallace2.scad>;

//base_end();

//translate([motor_casing+10,0,0]) 

base_end2();


module base_end2() difference() {

	// top plate & nema mount
	union(){
		linear_extrude(height = 3, convexity = 5) difference() {
			square([yz_motor_distance + motor_casing - motor_screw_spacing + 10, motor_casing + rod_size * 4], center = true);
			// nema motor arcs
			for(end = [1]) {
				for(side = [1,-1]) translate([end * (yz_motor_distance + motor_casing - motor_screw_spacing) / 2, side * motor_screw_spacing / 2, 0]) circle(m3_size * da6, $fn = 6);
				translate([end * (yz_motor_distance + motor_casing) / 2, 0, 0]) #circle(motor_screw_spacing / 2);
			}
		}

		// X-rod retainers
		translate([0,0,rod_size/2]){
			for(side = [1, -1]) translate([0, side * 0.5 *(motor_casing + rod_size * 4), 0]) rotate([90, 0, 90]) {
				translate([-rod_size*side,rod_size,0]) 
					cylinder(r = (motor_casing + rod_size * 4)/2 - (motor_casing / 2 + rod_size), h = yz_motor_distance + motor_casing - motor_screw_spacing + 10, center = true);
				// block coupling rod retainer to base plate
				translate([-rod_size*side,0.5*rod_size-1,]) 
					cube([rod_size*2,2+ rod_size,yz_motor_distance + motor_casing - motor_screw_spacing + 10],center=true);
			}
		}

		// block around Z-rods
		translate([yz_motor_distance / 2 - rod_size, 0, (end_height-motor_casing / 4)/2*1.2]) {
			cube([rod_size,motor_casing + rod_size * 4,(end_height-motor_casing / 4)*1.2],center=true);
		}

		// extra 	
		translate([yz_motor_distance / 2 - rod_size, 0, 0]) {
			cylinder(r=rod_size * da8 * 1.5, h=end_height-motor_casing / 4);
		}		
	}
	
	// X-rod holes
	translate([0,0,rod_size/2]){
		for(side = [1, -1]) translate([0, side * 0.5 *(motor_casing + rod_size * 4), 0]) rotate([90, 0, 90]) {
			translate([-rod_size*side,rod_size,0])
				#cylinder(r = rod_size * da8, h = yz_motor_distance + motor_casing + 20, center = true);
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
		%cylinder(r = rod_size * da8, h = 100, center = true, $fn = 8);
		for(side = [0, 1]) mirror([0, 0, side]) translate([0, 0, rod_size / 2 + 8]) {
			#cylinder(r = bearing_size / 2, h = bearing_length, center = false, $fn = 80);
			//cube([bearing_size / 2, bearing_size / 2, bearing_length]);
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