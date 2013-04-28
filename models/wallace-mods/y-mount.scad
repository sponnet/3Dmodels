
bearing_height = 7 + 1;
bearing_radius = 22;
bearing_hole = 8;
tolerance = 0.15;

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

y_mount();

translate([0, width + flesh + 1, 0])
y_retainer();

module y_retainer() {

	module halfretainer() {
		difference() {
			union() {

				translate([nema_hole_distance / 2, 0, 0])
				rotate([90, 0, 0]) {

					// base plate
					cylinder(h = 2, r = bearing_radius / 2 + 1 + tolerance, $fn = 20);

					translate([-bearing_radius - 0, -bearing_radius / 2 - 1, 0])
					cube([bearing_radius + 2, bearing_radius + 2, 2]);

					// nema mouting cylinders
					cylinder(h = 2 + 0.5, r = bearing_hole / 2 + 1, $fn = 20);

					// nema mouting cylinders
					cylinder(h = bearing_height + 2, r = bearing_hole / 2 - tolerance, $fn = 20);
				}
			}

			// nema mouting holes
			translate([nema_hole_distance / 2, 10, 0])
			rotate([90, 0, 0])
			cylinder(h = 50, r = nema_hole_diameter / 2 + nema_tolerance, $fn = 20);

			// nema mouting holes
			translate([nema_hole_distance / 2, tolerance, 0])
			rotate([90, 0, 0])
			cylinder(h = bearing_height + 2 + 2 * tolerance, r = nema_hole_diameter / 2 + nema_tolerance, $fn = 20);

		}

	}

	rotate([-90, 0, 0]) {
		halfretainer();
		rotate(180, [0, 1, 0])
		halfretainer();
	}

}

module y_mount() {

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

						// nema mouting cylinders
						translate([nema_hole_distance / 2, 0, 0])
						rotate([90, 0, 0])
						cylinder(h = height, r = nema_hole_diameter / 2 + nema_tolerance + 2, $fn = 20);

						// nema mounting block
						translate([0, -height, -nema_hole_diameter])
						cube([rod_distance / 2, height, nema_hole_diameter * 2]);

					}

					//translate([0, -height*1.5, - zipperwidth /2 ])
					//cube([rod_distance/2 + rod_hole/2 ,height,zipperwidth]);


				}

				// rod hole
				translate([rod_distance / 2,  - rod_hole / 2 - height / 2, -width])
				cylinder(r = rod_hole / 2, h = width * 2, $fn = 20);

				//ziptie holes around rods
				translate([mountdist / 2 - 1 / 2, -10, -zipperwidth / 2])
				cube([zipperlength, 30, zipperwidth]);
				translate([mountdist / 2 - 1 / 2 + zipperspacing, -10, -zipperwidth / 2])
				cube([zipperlength, 30, zipperwidth]);

				// nema mouting holes
				translate([nema_hole_distance / 2, 10, 0])
				rotate([90, 0, 0])
				cylinder(h = 50, r = nema_hole_diameter / 2 + nema_tolerance, $fn = 20);

			}
		}

	}
	rotate([-90, 0, 0]) {
		halfmount();
		rotate(180, [0, 1, 0])
		halfmount();
	}

}
