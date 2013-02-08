$fs = 1; // resolution of facets

R = 5; // radius of the sphere in OO system
X = 0.292 * R; // thickness of ridges in OO system

// "bone" piece
module bone() {
	difference() {
		
		union() {
		
			// spheres
			translate([R, 0, 0]) sphere(r=R);
			translate([-R, 0, 0]) sphere(r=R);
			
			// cylinder connecting spheres
			rotate([0,90,0]) translate([0,0,-R]) cylinder(2*R,R-X,R-X);
			
			// cylinders extending from both spheres
			translate([R,0,-R]) cylinder(2*R,R-X,R-X);
			translate([-R,0,-R]) cylinder(2*R,R-X,R-X);
			
		}
		
		// tunnel through extending cylinders
		translate([R,0,-2*R]) cylinder(4*R,R-2*X,R-2*X);
		translate([-R,0,-2*R]) cylinder(4*R,R-2*X,R-2*X);
	
		// tunnel through both spheres
		rotate([0,90,0]) translate([0,0,-2*R]) cylinder(4*R,R-2*X,R-2*X);
		
	}
}

// "joint" piece
module joint() {
	difference() {
		
		// main body
		union() {
			translate([R,0,-R]) cylinder(2*R,R,R);
			translate([-R,0,-R]) cylinder(2*R,R,R);
			translate([-R,-R,-R]) cube([2*R,2*R,2*R]);
		}	
		
		// vertical cutout from body, similar in shape to main body
		translate([ R,   0,-R]) cylinder(2*R,R-X,R-X);
		translate([-R,   0,-R]) cylinder(2*R,R-X,R-X);
		translate([-R,-R+X,-R]) cube([2*R,2*R-2*X,2*R]);
	
		// horizontal cutout from body
		translate([-R,0,0]) rotate([90,0,0]) translate([0,0,-2*R]) cylinder(4*R, R-X, R-X);
		translate([ R,0,0]) rotate([90,0,0]) translate([0,0,-2*R]) cylinder(4*R, R-X, R-X);
		translate([-2*R+X,0,0]) rotate([90,0,0]) translate([-R+X,-R+X,-2*R]) cube([2*R-2*X, 2*R-2*X, 4*R ]);
		translate([ 2*R-X,0,0]) rotate([90,0,0]) translate([-R+X,-R+X,-2*R]) cube([2*R-2*X, 2*R-2*X, 4*R ]);
	}
}

translate([0,2*R,R]) bone();
translate([0,-2*R,2*R]) rotate([0,90,0]) joint();
