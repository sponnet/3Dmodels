a();
module a(){
	difference(){
	cylinder(r=30,r2=25,h=40,center=false,$fn=80);
	translate([-33/2,-33/2,20])
	cube([33,33,1600]);
	translate([0,0,-1])cylinder(r=15,h=40,center=false);
	}

}