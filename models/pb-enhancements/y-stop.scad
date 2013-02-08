flesh=4;
tol=0.1;
$fn=40;
difference() {
	yhook();
	#cylinder(r=4+tol,h=17);
	translate([-4,0,0]) #cube([8,11,7]);
	rotate([0,90,0]) translate([-7/2,flesh+3.5,0]) #cylinder(r=1.5+tol,h=10);
	rotate([0,90,0]) translate([-7/2,flesh+3.5,-10]) #cylinder(r=1.5+tol,h=10);

}

module yhook(){
	translate([-8,0,0]) cube([8+2*flesh,11,7]);
	translate([0,-4-flesh+3,0]) cube([18,8,7]);
	cylinder(r=4+flesh,h=7);


}
