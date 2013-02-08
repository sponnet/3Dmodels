include <..\motul.scad>;
// binnendiameter buis
dia_inner = 110;
amount_of_punchholes = 7;
disc_h = 3;
$fn=40;
winchdop();


	translate([-40,-3,4]) scale(0.2) linear_extrude(height=2) { motul_logo(); } 


module winchdop(){

	union(){

	difference(){
		// main disc
		union(){
			cylinder(r=dia_inner/2 + 3.2 ,h=disc_h);
			cylinder(r=6+7 ,h=disc_h+5);
		}
		// middle hole
		cylinder(r=7 ,h=disc_h + 5);

		translate ([-20,0,disc_h+3]) rotate([0,90,0])  #cylinder(h=40,r=1.5);


		// decoration holes
		for (i= [0:amount_of_punchholes])
		{
			hull(){
				// grote cirkel
				rotate([0,0,360/amount_of_punchholes*i]) 
				translate([dia_inner/3,0,0]) 
				#cylinder(r=dia_inner/10,h=disc_h+1);

				// kleine cirkel
				rotate([0,0,360/amount_of_punchholes*i]) 
				translate([dia_inner/6,0,0]) 
				#cylinder(r=dia_inner/30,h=disc_h+1);
			}

		}
	}
	
	difference(){
		translate([0,0,disc_h])
			cylinder(r=dia_inner/2,h=5);
			
		translate([0,0,disc_h])
			cylinder(r=dia_inner/2-5,h=5+1);
	}

	}

}