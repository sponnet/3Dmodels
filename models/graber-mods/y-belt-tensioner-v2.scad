difference(){
	hull(){
	#cylinder(r=6,h=3,$fn=20);
	translate([20,0,0]) #cylinder(r=6,h=3,$fn=20);
	}
	translate([0,0,0]) #cylinder(r=4/2+.1,h=11,$fn=20);
	translate([20,0,0]) #cylinder(r=4/2+.1,h=11,$fn=20);

}

module beltclamp(h){
		cube([28,9,h],center=false);
}

module beltclamp_neg(h){
		translate([2,0,-1]) #cube([4,2,h+3],center=false);	
		translate([2+5*2,0,-1]) #cube([4,2,h+3],center=false);		
		translate([2+5*4,0,-1]) #cube([4,2,h+3],center=false);		

		translate([2,7,-1]) #cube([4,2,h+3],center=false);	translate([2+5*2,7,-1]) #cube([4,2,h+3],center=false);		
		translate([2+5*4,7,-1]) #cube([4,2,h+3],center=false);		

}

