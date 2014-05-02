$fn=30;

difference(){
	union(){
		cube([1,17,10]);
		translate([0,2,0]) cube([5,6,10]);
	}

	translate([0,3,0]) cube([4,3,10]);
}



