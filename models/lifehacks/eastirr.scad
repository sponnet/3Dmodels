diam=35;
$fn=24;
module outershell(diam){
	union(){
		intersection(){
			hull(){
				sphere(r=diam);
				translate([0,0,diam+9]) sphere(r=diam/5);
			}
			translate([-diam,-diam,0]) cube([diam*2,diam*2,diam*2]);
		}
	}
}
module innershell(diam){
	hull(){
			sphere(r=diam*(22/25));
			translate([0,0,diam]) sphere(r=diam/5);
		}
}

difference(){

	union(){
		hull(){
			translate([-10,0,0]) outershell(diam);
			translate([10,0,0]) outershell(diam);
		}

		hull(){
			translate([-10,0,0]) 		cylinder(r=diam+4,h=2.5);;
			translate([10,0,0]) 		cylinder(r=diam+4,h=2.5);;
		}
	}

	hull(){
		translate([-10,0,0]) innershell(diam);
		translate([10,0,0]) innershell(diam*0.8);
	}


	// rope holes		
	translate([-diam*2,0,diam+4+5+1]) rotate([90,0,90]) #cylinder(r=2,h=diam*4);
	// ziptie holes
	translate([-15,diam*2,2+2.5]) rotate([90,0,0]) cylinder(r=2,h=diam*4);
	translate([15,diam*2,2+2.5]) rotate([90,0,0]) cylinder(r=2,h=diam*4);
}




