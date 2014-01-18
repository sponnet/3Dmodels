$fn=30;

difference(){
	translate([0,2,0])hull(){
		translate([0,-5,0])cube([5,5,13]);
		translate([5,0,0])cylinder(r=5,h=13);
		translate([0.2,15,0])cylinder(r=0.2,h=13);
	}

	for ( i = [-70 : 10 : 30] )
	{
		rotate([0,90,i]) translate([-13/2-2,0,-20]) #cube([4,4,100]);
	}
}
