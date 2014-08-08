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
			translate([0,0,h/2])cube([8+25*2,25,h],center=true);
			// side block
			translate([-25-4-5,-27-25,0])cube([8+25*2+10,25,h],center=false);
//			translate([0,-32-5,5/2])cylinder(r=12/2,h=5,center=true);
			
		translate([29,-40,0]) beltclamp(h+4+5+10);
		translate([-29-18,-40,0]) beltclamp(h+5+10);


			//side block for belt
			//translate([0,-27-20,h/2+5/2])cube([8+25*2+30,20,h+5],center=true);
			
		}
 		// Small bearing holder holes cutter
 		translate([0,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
 		// Small bearing holder holes cutter
 		translate([0,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);

		
		hull(){
			translate([0,-40,0]) #cylinder(h=40,r=20/2,center=true);
			translate([0,-50,0]) #cylinder(h=40,r=20/2,center=true);

			//translate([hull_w/2,0,0]) #cylinder(h=40,r=18/2,center=true);
			//translate([-hull_w/2,0,0]) #cylinder(h=40,r=18/2,center=true);
		}
	
		// screw holes for extruder
		translate([50/2,-45-4,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
		hull(){
			translate([-50/2,-45-4,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
			translate([-50/2+4,-45-4,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
		}


		// bump holes for extruder
		translate([50/2+15,-45-4+15,-4])	#cylinder(h=8,r=12/2 + 0.3,center=false);
		hull(){
			translate([-50/2,-45-4+15,-4])	#cylinder(h=8,r=12/2 + 0.3,center=false);
			translate([-50/2+4,-45-4+15,-4])	#cylinder(h=8,r=12/2 + 0.3,center=false);
		}


		// screw holes for extruder / center
		translate([50/2,0,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
		hull(){
			translate([-50/2,0,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
			translate([-50/2+4,0,0])	#cylinder(h=40,r=4/2 + 0.3,center=true);
		}



		// extruder spacing
			
		// side block
		//translate([0,-27-20,h/2]) #cube([8+25*2+30-10,10,h+20],center=true);


		translate([29+18-5,-40+5,0]) #cube([18,18-10,5],center=false);

	}
}

module beltclamp(h){
	
	difference(){
		cube([18,18,h],center=false);
		translate([10/2,10/2,-1]) #cube([18-10,18-10,h+2],center=false);
		
	}
}

bearing_base();
