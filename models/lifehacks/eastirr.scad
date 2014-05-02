diam=35;
$fn=14;

difference(){
	union(){
		intersection(){
			hull(){
				sphere(r=diam);
				translate([0,0,diam+9]) sphere(r=diam/5);
			}
			translate([-diam,-diam,0]) cube([diam*2,diam*2,diam*2]);
		}
		cylinder(r=diam+4,h=2.5);
	}
	
	hull(){
			sphere(r=diam*(22/25));
			translate([0,0,diam]) sphere(r=diam/5);
		}
		
	translate([0,diam*2,diam+4+5+1]) rotate([90,0,0]) cylinder(r=2,h=diam*4);
	translate([0,diam*2,2+2.5]) rotate([90,0,0]) cylinder(r=2,h=diam*4);
}




