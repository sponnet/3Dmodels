use <bearing.scad>
include <wallace2.scad>;

module bearing_base(){
	h=7;
	hull_w = 15;
	
	difference(){
		union(){

			// 4 bearings
			translate([-20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([-20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);

			// middle block
			translate([-36.5,-27,0])cube([8+25*2+15,70,h],center=false);

			// belt clamps				
			translate([11.5,27,0]) beltclamp(21);
			translate([-36.5,27,0]) beltclamp(21);

			// extruder positive part
			translate([0,-22,0]){
				translate([0,61,0])	#cylinder(r=4/2+0.1,h=20);
				#hull(){
					translate([10,22,0]) 		cylinder(r=15/2+0.1,h=16);
					translate([16,22,0]) 		cylinder(r=15/2+0.1,h=16);
				}
				#cylinder(r=4/2+2+0.1,h=12);
			}

			// hooks 
			translate([6,0,0]){
				translate([-25,-23,0]){
					difference(){
						hull(){
							translate([0,0,7+7])rotate([90,0,0])cylinder(h=4,r=6/2);
							translate([0,0,7])rotate([90,0,0])cylinder(h=4,r=6/2);	
						}
						translate([0,1,7+7])rotate([90,0,0])cylinder(h=6,r=3/2);
							
					}
				}
				translate([25,-23,0]){
					difference(){
						hull(){
							translate([0,0,7+7])rotate([90,0,0])cylinder(h=4,r=6/2);
							translate([0,0,7])rotate([90,0,0])cylinder(h=4,r=6/2);	
							}
						translate([0,1,7+7])rotate([90,0,0])cylinder(h=6,r=3/2);		
					}
				}
			}

			
		}

 		// Small bearing holder holes cutter
 		translate([-20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(1);
 		translate([20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(1);

 		// Small bearing holder holes cutter
 		translate([-20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(1);
 		translate([20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_holes(1);

 		// extruder negative part
		translate([0,-22,0]){
			translate([-6.5/2,61/2-25/2,0])#cube([6.5,25,10]);
			#cylinder(r=4/2+0.1,h=20);
			translate([0,61,0]) 		#cylinder(r=4/2+0.1,h=20);
			hull(){
				translate([10,22,0]) 		cylinder(r=8/2+0.1,h=20);
				translate([16,22,0]) 		cylinder(r=8/2+0.1,h=20);
			}
		}

		// utility ziptie holes between rods.
		translate([-34,-2,0]) #cube([2,4,h+2],center=false);	
		translate([34-2,-2,0]) #cube([2,4,h+2],center=false);	


		// belt clamps	(negative)			
		translate([11.5,27,0]) beltclamp_neg(21);
		translate([-36.5,27,0]) beltclamp_neg(21);		
		
	}
}

module beltclamp(h){
		cube([25,13,h],center=false);
}

module beltclamp_neg(h){
		translate([10/2,2,-1]) #cube([4,2,h+2],center=false);	translate([10/2+5*2,2,-1]) #cube([4,2,h+2],center=false);		

		translate([10/2,2+7,-1]) #cube([4,2,h+2],center=false);	translate([10/2+5*2,2+7,-1]) #cube([4,2,h+2],center=false);		
}

bearing_base();
