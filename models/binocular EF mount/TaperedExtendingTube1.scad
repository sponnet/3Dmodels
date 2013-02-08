module innerTube(radius,height) {
	difference() {
		cylinder(height,radius,radius);
		translate([0,0,-1]) cylinder(height+2,radius-4,radius-4);
		for (i=[0:3]) {
			rotate([0,-1,i*90])translate([0-(radius-3),-3,3]) color([1,0,0,1])cube([4,6,height]);
		}
	}
}
module peggedTube(radius,height) {
	union() {
		innerTube(radius,height);
		rotate([0,0,0]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,90]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,-90]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
		rotate([0,0,180]) translate([0-(radius+2),-2,height-8]) cube([3,4,4]);
	}
}
module centerTube(radius,height) {
	union() {
		difference() {
			cylinder(height,radius-1,radius);
			translate([0,0,-1]) cylinder(height+2,radius-5,radius-5);
		}
		rotate([0,0,0]) translate([0-(radius+2),-2,4]) cube([4,4,height-4]);
		rotate([0,0,90]) translate([0-(radius+2),-2,4]) cube([4,4,height-4]);
		rotate([0,0,-90]) translate([0-(radius+2),-2,4]) cube([4,4,height-4]);
		rotate([0,0,180]) translate([0-(radius+2),-2,4]) cube([4,4,height-4]);
	}
}
module tube(tubeOuterRadius,tubeHeight,tubeCount,extend) {
	union() {
		innerTube(tubeOuterRadius,tubeHeight);
		if (tubeCount > 2) {
			for (i=[1:tubeCount-2]) {
				translate([0,0,extend*(0-i*(tubeHeight-12))]) rotate([0,0,(i%2)*90]) peggedTube(tubeOuterRadius-i*5,tubeHeight);
			}
		}
		if (tubeCount > 1) {
			translate([0,0,extend*(0-(tubeCount-1)*(tubeHeight-12))])  centerTube(tubeOuterRadius-(tubeCount-1)*5,tubeHeight);
		}
	}
}
//difference() {
	tube(60/d,30,2,0);
//	translate([0,0,-1]) cube([40,40,92]);
//}

difference() {
	cylinder(2,51/d,51/d);
	translate([0,0,-5]) cylinder(10,35/d,35/d);
}




d=1;
// koppeling draad
inner_hole = 35;
/*
difference() {
	cylinder(2,51/d,51/d);
	translate([0,0,-2]) cylinder(10,35/d,35/d);

}
*/

rad = 63.5/d;
difference() {
	cylinder(4,68.5/d,68.5/d);
	translate([0,0,-2]) cylinder(10,59/d,59/d);
	
	translate([0,rad,-2]) cylinder(10,3/d,3/d);
	translate([0,-rad,-2]) cylinder(10,3/d,3/d);
	translate([rad,0,-2]) cylinder(10,3/d,3/d);
	translate([-rad,0,-2]) cylinder(10,3/d,3/d);
}




