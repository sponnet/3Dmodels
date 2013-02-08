
	techdeck();


module techdeck(){


difference(){

union(){
	translate([63,0,0]) rocker();
	translate([-1.2,0,0])translate([0,-24/2,0])cube([63+2.4,24,4.1]);
	rotate([0,0,180])rocker();
}

translate([1.2,0,0]) #holeset();
translate([63+2.4+0.1-11,0,0]) #holeset();

}

}


module holeset(){
$fn=10;
translate([0,-2.5,-3]){
translate([0,0,0]) cylinder(r=0.75,h=10);
translate([0,5,0]) cylinder(r=0.75,h=10);
translate([7,5,0]) cylinder(r=0.75,h=10);
translate([7,0,0]) cylinder(r=0.75,h=10);


}
translate([-11/2+7/2,-8.5/2,3]){
cube([11,8.5,2]);
}

}

module rocker(){
rotate([0,30,0])
difference(){
	cylinder(h=4.1,r=12);
	translate([-25,-12,0])cube([24,24,4.1]);
}	
}
