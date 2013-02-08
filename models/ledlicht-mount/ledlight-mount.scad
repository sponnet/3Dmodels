tolerance = .4;
wall = 3;
hole_offset = 30;
$fn=40;

pillamp();
module pillamp() {

difference() {

	cylinder(h = 8, r = (25+wall+tolerance)/2);
	cylinder(h = 8, r = (25+tolerance)/2);

#	translate([0,-1.5,0]) cube([20,3,10]);

	


}

	difference() {
		hull() {
			cylinder(h = 1, r = (25+tolerance+wall)/2);
			translate([hole_offset,0,0]) 	cylinder(h = 1, r = (8+tolerance)/2);
		}
		translate([hole_offset,0,0]) cylinder(h = 1, r = (4+tolerance)/2);
	}		

}