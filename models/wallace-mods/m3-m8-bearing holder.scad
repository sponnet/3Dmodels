
tol=0.2;
$fn=20;

// center
difference(){

	union(){
		// center m8
		cylinder(r=4-tol,h=7);

		translate([0,0,-1]) cylinder($fn=50,r=5,h=1);
		translate([0,0,-1-2]) cylinder($fn=50,r=14,h=2);
		
		
	}

	
	//center m3
	translate([0,0,-tol-1-20]) cylinder(r=1.5+tol,h=7+2*tol+40);
}
	

