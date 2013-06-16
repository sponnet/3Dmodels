include <wallace2.scad>;


module bed_mount(width) difference() {
	linear_extrude(height = 10, convexity = 5) difference() {
		union() {
			rotate(180 / 8) circle((rod_size + 8) * da8, $fn = 8);
			translate([0, -rod_size / 2 - 4, 0]) square([rod_size / 2 + 8+width, max(rod_size + 8, rod_size / 2 + 4 + bed_mount_height)]);
		}
		rotate(180 / 8) circle(rod_size * da8, $fn = 8);
		translate([0, -rod_size / (1 + sqrt(2)) / 2, 0]) square([rod_size + 10 + width, rod_size / (1 + sqrt(2))]);
	}
	translate([rod_size / 2 + 1.5, -rod_size / 2 - 6, 5]) rotate([-90, 0, 0]) {
		hull(){
			cylinder(r = m3_size * da6, h = max(rod_size + 12, rod_size / 2 + 7 + bed_mount_height, $fn = 6));
			//translate([width,0,0]) #cylinder(r = m3_size * da6, h = max(rod_size + 12, rod_size / 2 + 7 + bed_mount_height, $fn = 6));
		}
		hull(){
			cylinder(r = m3_nut_size * da6, h = 4, $fn = 6);
			//translate([width,0,0])  #cylinder(r = m3_nut_size * da6, h = 4, $fn = 6);
		}
	}
}

!for(b = [0:1]) mirror([0, b, 0]) for(a = [-1,1]) translate([a * -7.5, 18 + 0*b - 5 * a, 0]) rotate(180 + 90 * a) bed_mount(b*0);