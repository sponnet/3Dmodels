include <wallace2.scad>;
$fn=60;
mirror([0,1,0]) rotate ([0,0,0]) translate([0,0,0]) y_bearing_retainer2();

module y_bearing_retainer2(){

// mounting plate for stopswitch
plate_width=4;
mirror([0,0,1]){

difference(){
	union(){
  translate([3,-40+1,-plate_width]) cube([18,40,plate_width]);
  //translate([5+1,-20+8,-plate_width+2-4]) cube([2,4,plate_width+2]);
  //translate([10+5+1,-20+8,-plate_width+2-4]) cube([2,4,plate_width+2]);

}
 	for ( i = [0 : 2] )
	{
		// stopswitch holes
  		translate([5+1,-20+1+3-i*10,-plate_width-1]) cube([2,4,plate_width+2]);
  		translate([10+5+1,-20+1+3-i*10,-plate_width-1]) cube([2,4,plate_width+2]);
	}

  // larger hole down
  translate([10+5+1,-8,-plate_width-1]) cube([8,13,plate_width+2]);

}
}
// retainer itself

intersection() {
	difference() {
		linear_extrude(height = 10, convexity = 5) difference() {
			union() {
				intersection() {
					translate([-yz_motor_distance / 2 + bearing_size / 2, 0, 0]) circle(bearing_size / 2 + 4);
					translate([-yz_motor_distance / 2 + bearing_size / 2 - bearing_size / 2 - 4, -bearing_size, 0]) square([bearing_size + 8, bearing_size]);
				}
				translate([-yz_motor_distance / 2 + bearing_size / 2 - bearing_size / 2 - 4, 0, 0]) #square([bearing_size + 8, bearing_size * sqrt(2) / 4 - 1]);
				translate([10, bearing_size * sqrt(2) / 4 - 3, 0]) square([yz_motor_distance + motor_casing - motor_screw_spacing + 10, 4], center = true);
				// hook
				translate([-25, bearing_size * sqrt(2) / 4 - 3+8, 0]) square([yz_motor_distance + motor_casing - motor_screw_spacing + 10, 4], center = true);
				// hook to retainer
				translate([-11.5, bearing_size * sqrt(2) / 4 - 3+4, 0]) #square([10, 4], center = true);
			}
			translate([-yz_motor_distance / 2 + bearing_size / 2, 0, 0]) circle(bearing_size / 2);
			translate([-yz_motor_distance / 2 + bearing_size / 2 - bearing_size / 2, 0, 0]) square(bearing_size);
			translate([-yz_motor_distance / 2 + bearing_size / 2 - bearing_size / 2+4, 4, 0]) rotate([0,0,45]) #square(bearing_size);
		}
		//screw holes
		for(side = [1]) translate([side * (yz_motor_distance + motor_casing - motor_screw_spacing) / 2, 0, 5]) rotate(90) rotate([90, 0, 90]) {
			cylinder(r = m3_size * da6, h = bearing_size, center = true, $fn = 16);
			translate([0, 0, bearing_size * sqrt(2) / 4 - 5]) rotate([180, 0, 0]) cylinder(r = m3_size, h = bearing_size, $fn = 30);
		}
	}
	translate([0, 0, 5]) rotate(90) rotate([90, 0, 90]) cylinder(r = (yz_motor_distance + motor_casing - motor_screw_spacing + 10) / 2, h = bearing_size + 10, center = true, $fn = 6);
}
}
