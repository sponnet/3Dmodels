$fn=30;
ring = 57;
linear_extrude(height=3){
	difference(){
		topbody();
		circle(r=0.95,$fn=6);
	}
//	cube([100,1],center=true);
}

module topbody(){
	scale(0.1){
	intersection(){
		union(){
			for ( i = [0 : 3] ){
				rotate([0,0,360/4*i]) drop();
			}

			difference(){
				circle(r=ring*3,$fn=50);
				circle(r=(ring-14)*3,,$fn=50);
			}
		}	
		circle(r=ring*3,$fn=50);
	}

	circle(r=35,$fn=50);
	}
}



	
module drop(){
	s=50;
	for ( i = [0 : s] ){
		rotate([0,0,90/s*i]) translate([i*3,0,0]) circle(r=3+i);
	}
}


