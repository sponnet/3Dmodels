include <nuts_and_bolts.scad>;


c_l = 45;
c_w = 20;
c_h = 5;
// flange height
f_h = 1.5;

// hole tolerance
h_tol = 0.3;

	difference(){
		union(){
			translate([-c_w/2,-5,0]) cube([c_w,c_l,c_h]);
			translate([0,-5+c_l,0]) cylinder(r=c_w/2,$fn=20,h=c_h);
		}
		
		// nut trap
		translate([0,0,0]) #cylinder (r=7/2 + 4* h_tol, h=2, $fn=6);
		
		// holes
		translate([0,0,0]) cylinder(r=4/2 + h_tol,h=c_h+1,$fn=20);
		translate([0,20,0]) cylinder(r=4/2 + h_tol,h=c_h+1,$fn=20);
		translate([0,40,0]) cylinder(r=4/2 + h_tol,h=c_h+1,$fn=20);

		// flange
		translate([-c_w/2,20-4/2-0.4-11,c_h-f_h]) #cube([c_w,11,f_h]);
		
		
	}


