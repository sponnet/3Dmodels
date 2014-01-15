use <bearing.scad>
include <wallace2.scad>;

module bearing_base(){
	h=12;
	hull_w = 15;
	
	difference(){
		union(){
			translate([0,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
			translate([0,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
			// middle block
			translate([0,0,h/2])cube([8+25*2,20,h],center=true);
		}
 		// Small bearing holder holes cutter
 		translate([0,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
 		// Small bearing holder holes cutter
 		translate([0,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);

		
		hull(){
			translate([hull_w/2,0,0]) #cylinder(h=40,r=18/2,center=true);
			translate([-hull_w/2,0,0]) #cylinder(h=40,r=18/2,center=true);
		}
	
	translate([50/2,0,0])	#cylinder(h=40,r=4/2 + 0.2,center=true);
	translate([-50/2,0,0])	#cylinder(h=40,r=4/2 + 0.2,center=true);


	}

}

bearing_base();
