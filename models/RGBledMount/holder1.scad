include <../lego-herofactory/hero_factory_female_clamp.scad>;
$fn=30;
difference(){
	union(){
	
	translate([-13.5,0,3.5]) 	clamp_female();
	rotate([0,0,90])	translate([-13.5,0,3.5]) 	clamp_female();
	translate([11.5,0,3.5]) clamp_male();
	rotate([0,0,90])		translate([11.5,0,3.5]) clamp_male();
	//female_dovetail(max_width=11, min_width=5, depth=5, height=30, block_width=15, block_depth=9, clearance=0.25);
	
	
		//cube(center=true,size=[20,20,1]);
		cylinder(r=14/2+1,h=10);
		
	}
	//t = 1;
	translate([0,0,-1]) cylinder(r=9/2,h=20);
	translate([0,0,2]) cylinder(r=12/2+0.5,h=30);
	translate([0,0,2]) cylinder(r=13/2+0.5,h=5);
	#translate([-((13)/2+1.5),-0.5,5+2])cube(center=false,size=[((13)/2+1.5)*2,1,40]);
	rotate([0,0,90]) #translate([-((13)/2+1.5),-0.5,5+2])cube(center=false,size=[((13)/2+1.5)*2,1,40]);
	
}
