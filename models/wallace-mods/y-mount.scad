module printrmount() {

	// rod diameter & distance
	rod_hole = 8;
	rod_distance = 60;  // Wallace = 62 ; Printrbot = 60

	// mount holes for zipties distance
	mountdist = rod_distance - rod_hole;
	zipperspacing = rod_hole;
	zipperwidth = 4;
	zipperlength = 2;

	// extra holes
	mountdist2 = 43;


	width = 20;
	height = 8;
	plateau_height= 3;
	flesh = 3;

	nema_hole_distance = 31;
	nema_hole_diameter = 3;
	nema_tolerance = 0.1;
	
	
	module halfmount() {

	difference() {

		difference() {
			
			union(){
				// rod hole block
				translate([rod_distance/2 - rod_hole/2 -flesh  , -rod_hole/2 - height/2  , -width/2])
				#cube([ rod_hole + flesh *2  ,rod_hole /2 + height/2 ,width]);

				// base
				translate([0, 0, - width /2 ])
				cube([rod_distance/2 + rod_hole/2 + flesh ,plateau_height,width]);

				// nema mouting cylinders
				translate([nema_hole_distance/2 , 0, 0])
				rotate([90,0,0])
				#cylinder(h=height,r=nema_hole_diameter/2 + nema_tolerance + 2,$fn=20);

				// nema mounting block
				translate([0, -height, -nema_hole_diameter ])
				cube([rod_distance/2 ,height,nema_hole_diameter*2]);
				
				
			}
			
			//translate([0, -height*1.5, - zipperwidth /2 ])
			//cube([rod_distance/2 + rod_hole/2 ,height,zipperwidth]);


		}
		
		

		// rod hole
		translate([rod_distance/2 , - rod_hole/2 -height/2   , -width])
		cylinder(r = rod_hole/2, h=width*2, $fn=100);

		//ziptie holes around rods
		translate([mountdist/2 - 1/2, -10, -zipperwidth/2])
		#cube([zipperlength, 30,zipperwidth]);
		translate([mountdist/2- 1/2 +zipperspacing, -10, -zipperwidth/2])
		#cube([zipperlength, 30,zipperwidth]);

		
		
		// nema mouting holes
		translate([nema_hole_distance/2 , 10, 0])
		rotate([90,0,0])
		#cylinder(h=50,r=nema_hole_diameter/2 + nema_tolerance,$fn=20);
		

	}

}			
	rotate([-90,0,0]) {
		halfmount();
		rotate(180, [0, 1, 0])
		halfmount();
	}


}

printrmount();
