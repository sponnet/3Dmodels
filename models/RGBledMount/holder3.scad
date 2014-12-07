include <dovetail.scad>;

$fn=30;
g=19;

module tjoep(){
	
		hull(){
			union(){
				translate([0,0,-1]) cylinder(r=9/2-0.25,h=20);
				translate([0,0,2]) cylinder(r=12/2+0.5,h=30);
				translate([0,0,2+5]) cylinder(r=13/2+0,h=5);
			}
				translate([0,8,4]) cylinder(r=0.5,h=10);

		}
}
k=30;
h_ring=20;


	
translate([-100+9/2,0,0]) male_dovetail(max_width=7, min_width=5, depth=3, height=h_ring, cutout_width=1, cutout_depth=4);
		

difference(){
	union(){
		difference(){
			cylinder(r=100,h=h_ring);
			translate([100-9,-3,0]) cube([10,10,h_ring]); //female_dovetail(max_width=7, min_width=5, depth=3, height=h_ring, block_width=9, block_depth=4, clearance=0.25);
		}
		translate([100-9/2-0.5,0,0]) rotate([0,0,180]) female_dovetail(max_width=7, min_width=5, depth=3, height=h_ring, block_width=9, block_depth=4, clearance=0.25);
	}
	translate([0,0,h_ring/2])for ( i = [0 : k] )
	{
	    rotate( i * 360 / k, [0, 0, 1])
	    translate([0,100, 0])
	    rotate ([90,0,0]) tjoep();
	}
	translate([0,0,-1]) cylinder(r=100-9,h=h_ring+2);
	translate([-100,0,-1]) cube([200,200,h_ring+2]);	



}

