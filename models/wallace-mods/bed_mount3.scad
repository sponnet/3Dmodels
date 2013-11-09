include <wallace2.scad>;
bed_mount2();
translate([-20,0,0]) mirror([1,0,0])bed_mount2();


module bed_mount2() difference() {
	union(){
//	linear_extrude(height = 10, convexity = 5) 
		difference() {
		union() {
			rotate(180 / 8) cylinder(r=(rod_size + 8) * da8,h=10, $fn = 8);
			translate([0, -rod_size / 2 - 4, 0]) cube([rod_size / 2 + 8, max(rod_size + 8, rod_size / 2 + 4 + bed_mount_height),10]);
		
		translate([0, bed_mount_height-5, 0])	cube([20,5,10+10]);
		
		}
		rotate(180 / 8) cylinder(r=rod_size * da8,h=10, $fn = 8);
		translate([0, -rod_size / (1 + sqrt(2)) / 2, 0]) cube([rod_size + 10, rod_size / (1 + sqrt(2)),10]);
	}
 }   
	translate([rod_size / 2 + 1.5, -rod_size / 2 - 6, 5]) rotate([-90, 0, 0]) {
		cylinder(r = m3_size * da6, h = max(rod_size + 12, rod_size / 2 + 7 + bed_mount_height, $fn = 6));
		cylinder(r = m3_nut_size * da6, h = 4, $fn = 6);
		translate([0,0,-rod_size / 2 + 8+bed_mount_height+4])#cylinder(r = m3_nut_size * da6, h = 4, $fn = 20);
		translate([0,0,-6])hull(){
		translate([0,-10,-rod_size / 2 + 8+bed_mount_height+5])#cylinder(r = m3_size * da6, h = 5+4, $fn = 20);
		translate([10,-10,-rod_size / 2 + 8+bed_mount_height+5])#cylinder(r = m3_size * da6, h = 5+4, $fn = 20);
		}

	}
}
