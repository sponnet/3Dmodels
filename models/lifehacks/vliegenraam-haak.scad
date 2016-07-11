linear_extrude(height=10){
difference(){
	union(){
square([17,0.5],center=false);
translate([17/2,0,0])circle(r=15/2);

	}
#translate([0,-20,0]) square([20,20],center=false);
#translate([17/2,0,0])circle(r=15/2-1);
}
}

