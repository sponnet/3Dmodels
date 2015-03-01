difference(){
	union(){
		beltclamp(8);
		translate([2.5+5*0,2,8])cube([3,5,1.2]);
		translate([2.5+5*1,2,8])cube([3,5,1.2]);
		translate([2.5+5*2,2,8])cube([3,5,1.2]);
		translate([2.5+5*3,2,8])cube([3,5,1.2]);
		translate([2.5+5*4,2,8])cube([3,5,1.2]);
	}
	beltclamp_neg(8);

	// screw holes block
	translate([6+3,10,8/2]) 
	rotate([90,0,0]) #cylinder(r=4/2,h=11,$fn=20);
	translate([6+3+10,10,8/2]) 
	rotate([90,0,0]) #cylinder(r=4/2,h=11,$fn=20);

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

