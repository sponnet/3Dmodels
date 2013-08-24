
bearing_height = 7 + 1;
bearing_radius = 22;
bearing_hole = 8;
tolerance = 0.07;

nema_hole_diameter = 3;
nema_tolerance = 0.15;

rod_hole = 8;
rod_distance = 62; // Wallace = 62 ; Printrbot = 60
nema_hole_distance = 31;

// mount holes for zipties distance
mountdist = rod_distance - rod_hole;
zipperspacing = rod_hole;
zipperwidth = 4;
zipperlength = 2;

// extra holes
mountdist2 = 43;

width = 20;
height = 8;
plateau_height = 3;
flesh = 3;

// flange parameters ; modify t_y to change appearance
t_x = nema_hole_distance / 2;
t_y = 10 * 1.618033;
t_r = bearing_radius / 2 + 1;


// Gallery of these parts
//y_mount(0);
//translate([0, width + flesh + 1, 0]) 
y_mount(1);
//translate([0, 2* (width + flesh + 1), 0])
//y_retainer();


module y_retainer() {

	module halfretainer() {
		difference() {
			union() {

				//rotate([90, 0, 0]) {

				// rounded flange
				difference() {
					cylinder(r = sqrt(pow(t_x, 2) + pow(t_y, 2)) - t_r, h = 2);

					for (z = [0, 1]) {
						mirror([0, z, 0]) {
							translate([0, t_y, -0.1])
							cylinder(r = sqrt(pow(t_x, 2) + pow(t_y, 2)) - t_r, h = 2 + 2 * 0.1);
						}
					}
				}

				translate([nema_hole_distance / 2, 0, 0]) {
					// base plate
					cylinder(h = 2, r = bearing_radius / 2 + 1 + tolerance);

					// nema mouting cylinders
					cylinder(h = 2 + 0.5, r = bearing_hole / 2 + 1);

					// nema mouting cylinders : 2=base plate, 1.5=extra M8 washer
					cylinder(h = bearing_height + 2 + 1.5, r = bearing_hole / 2 - tolerance);

				}
				//}
			}


		}

	}

	difference(){
		halfretainer();
		// nema screw hole, with little hull for tolerance
		hull(){
			translate([nema_hole_distance / 2, 0,  - .1]) # cylinder(h = bearing_height + 2 + 1.5 + 2 * .1, r = nema_hole_diameter / 2 + nema_tolerance,$fn=10);
			translate([nema_hole_distance / 2+1, 0,  - .1]) # cylinder(h = bearing_height + 2 + 1.5 + 2 * .1, r = nema_hole_diameter / 2 + nema_tolerance,$fn=10);
		}
	}

	mirror([1, 0, 0]) {
		difference(){
		halfretainer();
		// nema screw hole
		translate([nema_hole_distance / 2, 0,  - .1]) # cylinder(h = bearing_height + 2 + 1.5 + 2 * .1, r = nema_hole_diameter / 2 + nema_tolerance,$fn=10);
	}

	}

}

// parameters : nema_attached (0/1) : nema motor attached to the mount , or not ?
module y_mount(nema_attached=1) {

	module halfmount() {
		translate([0, -plateau_height, 0]) {
			difference() {

				difference() {

					union() {
						// rod hole block
						translate([rod_distance / 2 - rod_hole / 2 - flesh, -rod_hole / 2 - height / 2, -width / 2])
						cube([rod_hole + flesh * 2, rod_hole / 2 + height / 2, width]);

						// base
						translate([0, 0,  - width / 2])
						cube([rod_distance / 2 + rod_hole / 2 + flesh, plateau_height, width]);

						if (nema_attached == 0) {
							// if NEMA not attached , create a mounting block to support the screws
							// nema mouting cylinders
							translate([nema_hole_distance / 2, 0, 0])
							rotate([90, 0, 0])
							cylinder(h = height, r = nema_hole_diameter / 2 + nema_tolerance + 2);

							// nema mounting block
							translate([0, -height, -nema_hole_diameter])
							cube([rod_distance / 2, height, nema_hole_diameter * 2]);
						}
					}

					//translate([0, -height*1.5, - zipperwidth /2 ])
					//cube([rod_distance/2 + rod_hole/2 ,height,zipperwidth]);


				}

				// rod hole
				translate([rod_distance / 2,  - rod_hole / 2 - height / 2, -width])
				cylinder(r = rod_hole / 2, h = width * 2);

				for (z = [-width / 2 + zipperwidth, width / 2 - zipperwidth]) // two iterations, z = -1, z = 1
				{

					//ziptie holes around rods
					translate([mountdist / 2 - 1 / 2, -10, -zipperwidth / 2 + z])
					cube([zipperlength, 30, zipperwidth]);
					translate([mountdist / 2 - 1 / 2 + zipperspacing, -10, -zipperwidth / 2 + z])
					cube([zipperlength, 30, zipperwidth]);
				}
				// nema mouting holes
				translate([nema_hole_distance / 2, 10, 0])
				rotate([90, 0, 0])
				cylinder(h = 50, r = nema_hole_diameter / 2 + nema_tolerance,$fn=10);

				if (nema_attached == 1) {
					// make room for NEMA motor head
					for (z = [0, 1]) {
						mirror([0, 0, z]) {
							translate([0, plateau_height + .1, nema_hole_distance / 2]) {
								rotate([90, 0, 0])
								cylinder(h = plateau_height + .2, r = 23 / 2);
							}
						}
					}
				}

			}
		}

	}
	rotate([-90, 0, 0]) {
		halfmount();
		rotate(180, [0, 1, 0])
		halfmount();
	}

}
