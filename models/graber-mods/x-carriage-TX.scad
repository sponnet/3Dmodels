// PRUSA iteration3
// X carriage
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>

module x_carriage_base(){
 // Small bearing holder
 translate([-33/2,0,0]) rotate([0,0,90]) horizontal_bearing_base(2);
 // Long bearing holder
 translate([-33/2,45,0]) rotate([0,0,90]) horizontal_bearing_base(2);
 // Base plate
 translate([-33-12.5,-11.5,0]) cube([33+25,68,7]);
 // Belt holder base
 // ...left
 translate([-33-12.5-10,20+7-3-3,0]) cube([12,6+16-7,17]);
 // ...right
 translate([-33-12.5-10+33+25+8,20+7-3-3,0]) cube([10,6+16-7,17]);
}

module x_carriage_beltcut(){
 // Cut in the middle for belt
// translate([-16.5-2.25,19,7]) cube([4.5,13,15]);
 // Cut clearing space for the belt
 translate([-38-10,5,7]) cube([40+3+20,13,15]);

 // cut off clearance for graber frame
 translate([-38-10-0,-15.7,-1]) cube([40+3+20,13,15]);

 // hole to put extruder V5 through
 translate([-38+2,18,-1]) #cube([42+1-4,15+1,15]);

 
 // Belt slit
 translate([-66,21.5+10,7.01]) #cube([67*2,1,15]);
 // Smooth entrance
 translate([-66,21.5+10,14]) rotate([45,0,0]) cube([67+30,15,15]);
 // Teeth cuts
 for ( i = [-5 : 12] ){
  translate([0-i*5.08,21.5+8+0.5,7.01]) #cube([2.5,2.5,15]);
 }
/* for ( i = [7.7 : 14] ){
  translate([0-i*5.08,21.5+8+0.5,6]) #cube([2.5,2.5,15]);
 }
 */
}



module x_carriage_holes(){
 // Small bearing holder holes cutter
 translate([-33/2,0,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
 // Long bearing holder holes cutter
 translate([-33/2,45,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
  // Extruder mounting holes
  translate([-16.5+12,24,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5+12,24,10])cylinder(r=3.1, h=20, $fn=6); 
  translate([-16.5-12,24,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5-12,24,10])cylinder(r=3.1, h=20, $fn=6); 	

  //big hole
  translate([(-33)/2,22.5,-1]){
	cylinder(r=18, h=20, $fn=40); 
	for (o = [ -1 : 0 ]) rotate([0,0,18*o]){
		translate([-25,0,0]) cylinder(r=2.1,h=20,$fn=20);
		translate([25,0,0]) cylinder(r=2.1,h=20,$fn=20);
	}
  }
}

module x_carriage_fancy(){
 // Top right corner
 translate([13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom right corner
 translate([0,5,0]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-33,5,0]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-33-13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);	
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  translate([0,-3,0]) x_carriage_beltcut();
  x_carriage_holes();
  //x_carriage_fancy();
 }
}

x_carriage();