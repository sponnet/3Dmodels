include <../../../MCAD/motors.scad>
include <jhead.scad>

filament_d = 3;
spring_d = 10;
countersink = true;
	w=32;
	h=6.5;
	carriage_hole_distance = 30;


translate([0,20-4,0]) fanduct() ;

module baseblock(){
// base block
difference(){
	union(){
		intersection(){
			rotate([0,0,45]) cube([40+12,40+12,25],center=true);
			difference(){
				translate([-20,-20,0])cube([40,40,5+5.5-2]);
				translate([-21,0,4])cube([45,45,5+5.5]);
				translate([0,-12,4])cube([45,45,5+5.5]);
				translate([0,0,2])cylinder(r=10+6,h=30);//larger hole
			}
		}
		//translate([0,6+5,0]) cube([4+4,20-11,8+4]);
	}

	// minus stepper motor
	linear_extrude(height=25) stepper_motor_mount(17,0,false);
	rotate([90,0,0]) translate([4,10,11]) {
	//#translate([0,0,-50])cylinder(r=filament_d/2,h=100,$fn=10);
	hotend_jhead();
	}

}
	
}

module fanduct(){

	intersection(){
		translate([-carriage_hole_distance/2-(1.5+2),(-carriage_hole_distance-(1.5+2)*2)-20-h/2+(1.5+2),0]) cube([2*(1.5+2)+(carriage_hole_distance),2*(1.5+2)+(carriage_hole_distance),2*(1.5+2)+(carriage_hole_distance)]);
		difference(){
			union(){
				
				difference(){
				hull(){
					translate([-carriage_hole_distance/2,-20-h/2,0]) cylinder(r=1.5+2,h=3,$fn=20);
					translate([carriage_hole_distance/2,-20-h/2,0]) cylinder(r=1.5+2,h=3,$fn=20);
					translate([-carriage_hole_distance/2,-20-h/2-carriage_hole_distance,0]) cylinder(r=1.5+2,h=3,$fn=20);
					translate([carriage_hole_distance/2,-20-h/2-carriage_hole_distance,0]) cylinder(r=1.5+2,h=3,$fn=20);
				}
				translate([-carriage_hole_distance/2,-20-h/2,0]) cylinder(r=1.5,h=10,$fn=10);
				translate([carriage_hole_distance/2,-20-h/2,0]) cylinder(r=1.5,h=10,$fn=10);
				translate([-carriage_hole_distance/2,-20-h/2-carriage_hole_distance,0]) cylinder(r=1.5,h=10,$fn=10);
				translate([carriage_hole_distance/2,-20-h/2-carriage_hole_distance,0]) cylinder(r=1.5,h=10,$fn=10);

				translate([0,-20-h/2-carriage_hole_distance/2,0]) cylinder(r=17,h=10,$fn=40);

				}

			
				hull(){
					translate([0,-20-h/2-carriage_hole_distance/2,3]) cylinder(r=17+1,h=1,$fn=40);
					rotate([90,0,0]) translate([4,10,11+10]) cylinder(r1=22/2,r2=22/2,h=34);
				}
			}
			translate([0,0,-2]){

				hull(){
					translate([0,-20-h/2-carriage_hole_distance/2,3]) cylinder(r=17,h=1,$fn=40);
					rotate([90,0,0]) translate([4,10,11+10+1]) #cylinder(r1=22/2-1,r2=22/2-1,h=34-2);
				}

			
			}
			// JHEAD hole
			rotate([90,0,0]) translate([4,10,11+10-4]) #cylinder(r1=20/2-1,r2=20/2-1,h=32+8);
			}
		}
}	


module jhead_piece(){
// jhead piece
rotate([0,180,0]) translate([0,-10-60,-(8.5+1)*2])
union(){


	difference(){
		intersection(){
			rotate([0,0,45]) cube([40+12,40+12,50],center=true);
			translate([-20,-20,8.5]) cube ([40,10-2,8.5+2]);
		}
		// minus stepper motor
		linear_extrude(height=25) stepper_motor_mount(17,0,false);
		// minus hotend
		rotate([90,0,0]) translate([4,10,11]) {
			hotend_jhead();
		}
	}
}

}

module base() difference() {
	linear_extrude(height = 15, convexity = 5) difference() {
		union() {
			square([31, 10], center = true);
			translate([-15.5, 0, 0]) rotate(120) {
				translate([0, -5, 0]) square([5, 10]);
				translate([5, 0, 0]) circle(5);
				translate([5, 0, 0]) rotate(-150 - 9 / 2) square([15, 5]);			
			}
			for (side = [1, -1]) translate([side * 15.5, 0, 0]) circle(5);
		}
		for (side = [1, -1]) translate([side * 15.5, 0, 0]) circle(3 * 7/12, $fn = 6);
		translate([0, -15.5, 0]) circle(12);
	}
	translate([0, 0, 4.4]) linear_extrude(height = 15, convexity = 5) {
		translate([-15.5, 0, 0]) rotate(30) translate([0, 5, 0]) rotate(-60 - 9 / 2) translate([-5, 5, 0]) square(100);
		translate([0, -10, 0]) square(100);
	}
	if (countersink) translate([-15.5, 0, 15 - 4]) cylinder(r1 = 0, r2 = 8, h = 8, $fn = 15);
	translate([-15.5, 0, 4.4 + 10.6 / 2]) rotate([90, 0, 150 - 4.5]) translate([0, 0, 4]) cylinder(r = spring_d * 7/12, h = 10, $fn = 16);
}
