tol=0.1;
$fn=40;

difference() {
	union() {
		translate([-16/2,-9,5]) cube(size=[16,18,6]);
		translate([-8,-9,0]) cube(size=[16,2,5]);
	}
	
	translate([0,0,-1]) #cylinder(r=4+tol,h=20);
	//translate([0,0,-1]) #cylinder(r=5+tol,h=6);
	translate([-5,20,3]) rotate([90,0,0]) #cylinder(r=1.5,h=30);
	translate([5,20,3]) rotate([90,0,0]) #cylinder(r=1.5,h=30);

	//spleet
	//translate([-8,-2,5]) #cube(size=[16,20,1]);
	
	// klem gat
	translate([(-8-tol)/2,0,5]) cube(size=[8+tol,20,10]);
	// schroefgat
	translate([-20,6,8]) rotate([0,90,0]) #cylinder(r=1.5,h=40);
	


}

