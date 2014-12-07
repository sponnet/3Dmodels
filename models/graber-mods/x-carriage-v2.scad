use <bearing.scad>
include <wallace2.scad>;

module bearing_base(){
	h=7;
	hull_w = 15;
	
	difference(){
		union(){
			translate([-20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([20,-x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([-20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);
			translate([20,x_rod_spacing/2,0]) rotate([0,0,90]) horizontal_bearing_base(1);

			// middle block
			translate([-36.5,-27,0])cube([8+25*2+15,72,h],center=false);
			// side block
			//translate([-25-4-5,-27-25-3,0])cube([8+25*2+10,25+3,h],center=false);
//			translate([0,-32-5,5/2])cylinder(r=12/2,h=5,center=true);
			
		translate([29,40,0]) beltclamp(21);
		translate([-29-18,40,0]) beltclamp(21);


			//side block for belt
			//translate([0,-27-20,h/2+5/2])cube([8+25*2+30,20,h+5],center=true);


			// extruder positive part
			translate([0,-22,0]){
				//translate([-6.5/2,61/2-25/2,0])#cube([6.5,25,10]);
				//#cylinder(r=4/2+0.1,h=20);
				translate([0,61,0]) 		#cylinder(r=4/2+0.1,h=20);
				#hull(){
					translate([10,22,0]) 		cylinder(r=15/2+0.1,h=16);
					translate([16,22,0]) 		cylinder(r=15/2+0.1,h=16);
				}
				#cylinder(r=4/2+2+0.1,h=12);
			}

			// hooks 
			translate([6,0,0]){
				translate([-25,-25,0]){
					difference(){
						hull(){
							translate([0,0,7+7])rotate([90,0,0])cylinder(h=2,r=6/2);
							translate([0,0,7])rotate([90,0,0])cylinder(h=2,r=6/2);	
						}
						translate([0,1,7+7])rotate([90,0,0])cylinder(h=4,r=3/2);
							
					}
				}
				translate([25,-25,0]){
					difference(){
						hull(){
							translate([0,0,7+7])rotate([90,0,0])cylinder(h=2,r=6/2);
							translate([0,0,7])rotate([90,0,0])cylinder(h=2,r=6/2);	
							}
						translate([0,1,7+7])rotate([90,0,0])cylinder(h=4,r=3/2);		
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
			#hull(){
				translate([10,22,0]) 		cylinder(r=8/2+0.1,h=20);
				translate([16,22,0]) 		cylinder(r=8/2+0.1,h=20);
			}
		}

		translate(){
			translate([-26,30,0]) #cylinder(r=3,h=10);
		}


		// extruder spacing
			
		
	}
}

module beltclamp(h){
	
	difference(){
		cube([18,18,h],center=false);
		translate([10/2,10/2,-1]) #cube([18-10,18-10,h+2],center=false);
		
	}
}

bearing_base();
