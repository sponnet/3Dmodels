module printrmount() {

	// rod diameter & distance
	rod_hole = 8;
	rod_distance = 60;

	// mount holes for zipties distance
	mountdist = 52;
	zipperspacing = 8;
	zipperwidth = 4;
	zipperlength = 2;

	// extra holes
	mountdist2 = 43;


	width = zipperwidth *2;
	height = 4;
	flesh = 3;


	module halfmount() {

	difference() {

		difference() {
			
			union(){
				// rod hole block
				translate([rod_distance/2 - rod_hole/2 -flesh  , -rod_hole/2 - height/2 + 1  , -width/2])
				#cube([ rod_hole /2 + flesh  ,rod_hole /2 + height/2 - 1,width]);

				// base
				translate([0, -height/2, - width /2 ])
				cube([rod_distance/2 + rod_hole/2 + zipperlength/4 ,height,width]);
			}
			
			translate([0, -height*1.5, - zipperwidth /2 ])
			cube([rod_distance/2 + rod_hole/2 ,height,zipperwidth]);


		}
		
		

		// rod hole
		translate([rod_distance/2 , - rod_hole/2 -height/2   , -width])
		cylinder(r = rod_hole/2, h=width*2, $fn=100);

		//ziptie holes around rods
		translate([mountdist/2 - 1/2, -10, -zipperwidth/2])
		cube([zipperlength, 30,zipperwidth]);
		translate([mountdist/2- 1/2 +zipperspacing, -10, -zipperwidth/2])
		cube([zipperlength, 30,zipperwidth]);

		//extra ziptie holes for Sanguinololu board
		translate([mountdist2/2 - 1/2, -10, -zipperwidth/2])
		cube([zipperlength, 30,zipperwidth]);



	}

}	
	translate([0,0,height/2]) {
		rotate([-90,0,0]) {
			halfmount();
			rotate(180, [0, 1, 0])
			halfmount();
		}
	}

}

printrmount();
