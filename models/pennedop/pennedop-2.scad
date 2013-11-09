
h=21;
v=7;
di = 1;
module pennedop() {
$fs=0.1;
	difference() {
		cylinder(v,(12.5/2)+di,(12.5/2)+di);
		translate([0,0,-0.1])cylinder(v+0.11,(12/2)+di,(12/2)+di);
	}


	difference() {
		cylinder(1.8,(12/2)+di,(12/2)+di);
		//cylinder(1.8,(11.5/2)+di,(11.5/2)+di);
	}

	difference(){
		translate([0,0,v]) cylinder(h-v,(12.5/2)+di,0);
		//translate([0,0,v]) cylinder(h-v-2,(12/2)+di,0);
	}




}
module a(){
 	scale(0.7) translate([-22,-22,0.1]) import("darthVader_cleaned_fixed.stl");
}

difference(){
	intersection(){ cube([10,10,10],center=true); a(); }
	pennedop();
}
