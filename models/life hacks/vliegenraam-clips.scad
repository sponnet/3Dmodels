$fn=30;

difference(){
	union(){
		cube([1,15,10]);
		translate([0,2,0]) cube([5,5,10]);
	}

	translate([-1,3,-1]) cube([4+1,3,10+2]);
}



