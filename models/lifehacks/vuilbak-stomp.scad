a();
module a(){
	difference(){
	cylinder(r=50,h=15);
	translate([0,0,4]) cylinder(r=45,h=15);
	translate([-30,-80,-1]) cube([160,160,160]);
	translate([-70,20,15/2]) rotate([0,90,0]) { #cylinder(r=4/2,h=100); translate([0,00,-74]) #cylinder(r=4,h=100) ; }
	translate([-70,-20,15/2]) rotate([0,90,0]) { #cylinder(r=4/2,h=100); translate([0,00,-74]) #cylinder(r=4,h=100) ; }
	}
}