r=11/2;
div=50;

for ( i = [-3 : 3] ) {

translate([i*r*2.3,0,0]){
	difference(r){
		translate([-r*2.3/2,-r*2.3/2,0]) cube([r*2.3,r*2.3,3]);
		#tjoep(r*(1+i/div));
	}
}

}


module tjoep(r){
	translate([0,0,r/5]) hull(){
 		sphere(r=r,$fn=40);
 		translate([0,0,r*2])sphere(r=0.1,$fn=20);
	}
}



