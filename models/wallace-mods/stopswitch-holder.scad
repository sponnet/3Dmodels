tol=0.1;
$fn=40;
width = 18;
length=20;
height = 6;
switch_plate_length=3;
switch_plate_height=5;


stopswitch_holder();

module stopswitch_holder(){

	rotate([0,180,0])
	difference() {
		union() {
			translate([-width/2,-length/2,-height]) cube(size=[width,length,height]);
			translate([-width/2,-length/2,0]) cube(size=[width,switch_plate_length,switch_plate_height]);
		}
		
		translate([0,0,-height-tol]) #cylinder(r=4+tol,h=height+2*tol);
		//translate([0,0,-1]) #cylinder(r=5+tol,h=6);

		// gaten zipties
		translate([-5,-length/2+switch_plate_length+tol,switch_plate_height/2]) rotate([90,0,0]) #cylinder(r=1.5,h=switch_plate_length+2*tol);
		translate([5,-length/2+switch_plate_length+tol,switch_plate_height/2]) rotate([90,0,0]) #cylinder(r=1.5,h=switch_plate_length+2*tol);
	
		// klem gat
		translate([(-8-tol)/2,0,-height-tol]) #cube(size=[8+tol,length/2+tol,height+2*tol]);
		// schroefgat
		translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) #cylinder(r=1.5,h=width+2*tol);
		


	}
}
