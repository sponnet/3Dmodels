module gregs_to_bowden(){

dia = 49;
extrawidth = 5;

height = 5;
extraheight = 20-height;
width = 16;
m8hole = 10;
m4hole = 4.2;
$fn=100;

y=14.5;
z=5;
bearing_dia = 15.6;

rotate([0,90,0])
	difference(){
		union(){
			translate([-width/2,-dia/2-extrawidth,0]) cube([width,dia+extrawidth*2,height]);

			translate([-width/2,-m8hole/2-2,0]) cube([width,m8hole+4,bearing_dia]);

			//#cylinder(height+extraheight,m8hole/2+2,m8hole/2+2);	

			translate([-width/2,y,bearing_dia/2+z]) rotate([0,90,0]) cylinder(width,bearing_dia/2+2,bearing_dia/2+2);
			translate([-width/2,y-bearing_dia/2-2,bearing_dia/2+z]) rotate([0,90,0]) cube([width-z,bearing_dia+4,width]);

//			translate([0,-4,z]) cube([20,8,8]);

			// extra blok rechts
			translate([-width/2,dia/2-m4hole/2,0]) #cube([width,m4hole+2,bearing_dia+5]);
			translate([-width/2,dia/2-m4hole/2-2,bearing_dia+3]) #cube([width,m4hole+2*2,2.5]);

	
		}
			translate([-width/2-1,y,bearing_dia/2+z]) rotate([0,90,0]) cylinder(width+10,bearing_dia/2,bearing_dia/2);

		#cylinder(20,m8hole/2,m8hole/2);
		//translate([0,0,height+extraheight])#cylinder(200,m8hole/2+2,m8hole/2+2);
		translate([0,-dia/2,0]) #cylinder(height+20,m4hole/2,m4hole/2);
		translate([0,dia/2,0]) #cylinder(height+20,m4hole/2,m4hole/2);

		// look-though hole... this is pretty useless :)
		//translate([-width/2-1,0,height/2+2]) rotate([0,90,0]) #cylinder(width+2,2,2);

	}

}

gregs_to_bowden();

