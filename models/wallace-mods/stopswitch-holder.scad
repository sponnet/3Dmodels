tol=0.1;
$fn=40;
width = 15;
length=22;
height = 5;
switch_plate_length=3;
switch_plate_height=3;


stopswitch_holder();

module stopswitch_holder(){

	rotate([0,0,90])
	difference() {
		union() {
			translate([-width/2,-length/2,-height]) cube(size=[width,length,height]);
			translate([-width/2,-length/2,0]) cube(size=[width,switch_plate_length,switch_plate_height]);
			// cone
			translate([0,0,-height]) cylinder(r=6.5+tol,h=height+switch_plate_height);
		}
		
		translate([0,0,-height-tol]) #cylinder(r=4+tol,h=height+switch_plate_height+2*tol);
		//translate([0,0,-1]) #cylinder(r=5+tol,h=6);

		// gaten zipties
		translate([-10/2-1.2/2,-length/2+switch_plate_length+tol,switch_plate_height-3-1]) rotate([90,0,0]) #cube(size=[1.2,3,switch_plate_length+2*tol]);
		translate([5-1.2/2,-length/2+switch_plate_length+tol,switch_plate_height-3-1.2]) rotate([90,0,0]) #cube(size=[1.2,3,switch_plate_length+2*tol]);

		// haakse gaten zipties
		rotate([90,0,0]) translate([0,length/2-switch_plate_height,length/2-(8-3)]) {
		// gaten zipties
		translate([-10/2-1.2/2,-length/2+switch_plate_length+tol,switch_plate_height-2.5-1]) rotate([90,0,0]) #cube(size=[1.2,3,height+tol*2]);
		translate([5-1.2/2,-length/2+switch_plate_length+tol,switch_plate_height-2.5-1.2]) rotate([90,0,0]) #cube(size=[1.2,3,height+tol*2]);
		}

		// extra balkje onder zipties
		translate([-10/2,-length/2+switch_plate_length,switch_plate_height-2.5]) rotate([0,90,0]) #cube(size=[1.2,1.2,10]);
		

		
		// klem gat
		translate([(-8-tol)/2,2,-height-tol]) #cube(size=[8+tol,length/2+tol,height+2*tol]);

		// weggommen halve cirkel geleidingsbus
		translate([(-7-tol),2,0]) cube(size=[14+2*tol,12/2+tol,switch_plate_height+2*tol]);

		// spleet voor ziptie achter rod
		//translate([(-width/2-tol),-length/2+switch_plate_length,0]) #cube(size=[width+2*tol,1,switch_plate_height+2*tol]);

		// schroefgat
		translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) #cylinder(r=1.5+tol*2,h=width+2*tol);
		


	}
}
