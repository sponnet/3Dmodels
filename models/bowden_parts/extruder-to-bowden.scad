module gregs_to_bowden(){

dia = 49;
extrawidth = 5;

height = 5;
extraheight = 9-height;
width = 16;
m8hole = 10;
m4hole = 4.2;
$fn=100;
	difference(){
		union(){
			translate([-width/2,-dia/2-extrawidth,0]) cube([width,dia+extrawidth*2,height]);
			#cylinder(height+extraheight,m8hole/2+2,m8hole/2+2);		
		}
		#cylinder(20,m8hole/2,m8hole/2);
		translate([0,-dia/2,0]) #cylinder(height+1,m4hole/2,m4hole/2);
		translate([0,dia/2,0]) #cylinder(height+1,m4hole/2,m4hole/2);

	}

}

gregs_to_bowden();

