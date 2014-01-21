$fn=30;

rotate([0,-90,0])difference(){
	translate([0,2,0])hull(){
		translate([0,-5,0])cube([5,5,13]);
		translate([5,0,0])cylinder(r=5,h=13);
		translate([0.2,15,0])cylinder(r=0.2,h=13);
	}

	for ( i = [-70 : 10 : 30] )
	{
		rotate([0,90,i]) translate([-13/2-2,0,-6]) #cube([4,4,20]);
	}
	rotate([0,90,0]) translate([-13/2-2,4,-6]) #cube([4,4,200]);
}
