sleuf=10;

difference() {
	union() {
		cube([10+sleuf,27.5,10]);
		translate([11+sleuf,18.5,0]) cylinder(10,9,9);
	}
	translate([11+sleuf,18.5,0]) cylinder(10,4.5,4.5);
	hull(){
		translate([4.5,-0.5,5]) rotate([-90,0,0]) cylinder(30,2,2,$fn=10);
		translate([4.5+sleuf,-0.5,5]) rotate([-90,0,0]) cylinder(30,2,2,$fn=10);
	}
	translate([0,17.5,0]) cube([10+sleuf,1.5,10]);
}