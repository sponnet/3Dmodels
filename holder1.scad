include <hero_factory_female_clamp.scad>;

$fn=30;
g=19;

module tjoep(){
	difference(){
		union(){
		/*
		translate([-14,0,3.5]) 	clamp_female();
		rotate([0,0,90])	translate([-14,0,3.5]) 	clamp_female();
		translate([11.5,0,3.5]) clamp_male();
		rotate([0,0,90])		translate([11.5,0,3.5]) clamp_male();
	*/
		//female_dovetail(max_width=11, min_width=5, depth=5, height=30, block_width=15, block_depth=9, clearance=0.25);
		
			translate([-g/2,-14/2,0])cube(center=false,size=[g,14,10]);
			//rotate([0,0,45])cylinder(r=14/2+2,h=10,$fn=4);
			
		}
		//t = 1;
		translate([0,0,-1]) cylinder(r=9/2-0.25,h=20);
		translate([0,0,2]) cylinder(r=12/2+0,h=30);
		translate([0,0,2]) cylinder(r=13/2+0,h=5);
	//translate([-((15)/2+1.5),-0.5,5+2])cube(center=false,size=[((15)/2+1.5)*2,1,40]);
		//rotate([0,0,90]) translate([-((15)/2+1.5),-0.5,5+2])cube(center=false,size=[((15)/2+1.5)*2,1,40]);
		
	}
}
k=25;
for ( i = [0 : k] )
{
    rotate( i * 360 / k, [0, 0, 1])
    translate([0, 75, 0])
    rotate ([90,0,0]) tjoep();
}
