//Title: Canon EF mount module
//Author: Alex English - ProtoParadigm
//Date: 8-8-2011
//License: GPL2

//Notes: This will create the actual bayonet and supporting structure, complete with the alignment dot.  To use, you will need to build whatever you're making into the center of this, or onto the other side of it.  As shown by a render of this file, you can see a cylinder cut through the middle of it for illustration.  The module itself does not have such a hole, so you can put whatever kind of hole you wish in it.

module EFmount() {
	$fa = 1;
	union() {
		#cylinder(h = 5, r = 68.5/2);
		translate([0, 0, 7])
			cylinder(h = 4, r = 50.5/2);
		translate([0, 0, 5])
			cylinder(h = 2, r = 54/2);
		translate([0, 0, 11])
			cylinder(h = 1.5, r = 41.5/2);
		translate([0, 0, 12.5])
			cylinder(h = 3.2, r1 = 39.7/2, r2 = 39.5/2);
		translate([0, 0, 7])
			threads();
		rotate([0, 0, -33])
			translate([-68.5/2, 0, 2.5])
				cube(size=[1, 2, 2], center = true);
	}
}

module threads() {
	difference() {
		cylinder(h = 4, r = 54/2);
		cylinder(h = 4, r = 50.4/2);
		cylinder(h = 2.3, r = 54/2);
		for(i = [ [0, 0, 0], [180, 0, -70], [0, 0, -120], [180, 0, -180], [0, 0, -230], [180, 0, -300] ])
		{
			rotate(i)	
				translate([-35, 0, -5])
					cube(size=[40, 18, 10]);
		}
	}
	intersection() {
		difference() {
			cylinder(h = 4, r = 54/2);
			cylinder(h = 4, r = 50.4/2);
		}
		translate([-54/2-1, 0, 0])
			cube(size=[4, 1.9, 4], center = false);
	}
	
	
}

rad = 63.5/2;

difference() {
	EFmount();
	translate([0,0,-2]) cylinder(h = 20, r = 33/2);

	translate([0,rad,-2]) cylinder(h=10,r=3/2,$fs=0.5);
	translate([0,rad,3]) cylinder(h=10,r=8/2,$fs=12);

	translate([0,-rad,-2]) cylinder(h=10,r=3/2,$fs=0.5);
	translate([0,-rad,3]) cylinder(h=10,r=8/2,$fs=12);

	translate([rad,0,-2]) cylinder(h=10,r=3/2,$fs=0.5);
	translate([rad,0,3]) cylinder(h=10,r=8/2,$fs=12);

	translate([-rad,0,-2]) cylinder(h=10,r=3/2,$fs=0.5);
	translate([-rad,0,3]) cylinder(h=10,r=8/2,$fs=12);

	translate([0,0,11]) cylinder(h = 20, r = 33);



}