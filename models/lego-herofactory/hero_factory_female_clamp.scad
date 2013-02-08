
herofactory_test();

$fn=30;
$hero_sphere_r = 5;
$hero_body_w = 15;
$hero_body_h = 3.5;

module herofactory_test(){

	union(){
			clamp_female();
			translate([17,0,0]) clamp_male();

	}

}


module clamp_male(){
	difference() {	
		union(){
			// Main sphere
			translate([0,00,$hero_sphere_r*.65*.5/2]) #sphere($hero_sphere_r+0.75);				
			rotate([0,-90,0]) translate([-$hero_sphere_r*.65*0.5,0,0]) #cylinder(h=11,r=$hero_sphere_r*.65);
		}
		translate([-12,-$hero_body_w/2,-$hero_body_h-2]) #cube([20,$hero_body_w,2]);
	}
}


module clamp_female() {
	intersection(){
		difference(){
			union(){
				// outer body
				translate([0,-$hero_body_w/2,-$hero_body_h])
					cube([$hero_body_h*2,$hero_body_w,$hero_body_h*2]);

				// Y-rounded cylinder at top of clamp
				rotate([90,0,0]) translate([0,0,-$hero_body_w/2]) #cylinder(h=$hero_body_w,r=$hero_body_h);

				// Y-cube at bottom of clamp
				translate([-$hero_body_h,-$hero_body_w/2,-$hero_body_h])
					cube([$hero_body_h,$hero_body_w,$hero_body_h]);

			}
			// sphere for fitting HF male piece
			translate([0,0,0]) #sphere($hero_sphere_r);

			// remove some material at the insert
			translate([-$hero_sphere_r*.75,0,-$hero_body_h]) cylinder(h=$hero_body_h*2,r=$hero_sphere_r*.75);

			translate([-$hero_sphere_r*1,-$hero_sphere_r*0.5,0]) rotate([0,90,0]) #cylinder(h=4,r=$hero_sphere_r/2);
			translate([-$hero_sphere_r*1,$hero_sphere_r*0.5,0]) rotate([0,90,0]) #cylinder(h=4,r=$hero_sphere_r/2);




	}
	// intersect with a larger cylinder to round off the outer body 
	translate([0,0,-$hero_body_h]) #cylinder(h=$hero_body_h*2,r=$hero_body_w/2);

}
}
