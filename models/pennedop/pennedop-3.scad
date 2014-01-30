r=11/2;
div=50;
i=3.5;
rr = r*(1+i/div);

//import("trooperhelemt2_repaired.stl");
//import("darthVader_cleaned_fixed.stl");

//intersection(){
 //translate([-25,-25,0])#cube([50,50,50]);
difference(){
	//scale(0.9) import("trooperhelemt2_repaired.stl");
//union(){
	//scale(0.6) translate([-22,-24,-1]) import("darthVader_cleaned_fixed.stl");
	#cylinder(r=rr*1.3,r2=3,h=20);
//	}
	translate([0,0,rr/5]) #sphere(r=rr,$fn=50); 
	translate([0,0,rr/5+rr/2]) #sphere(r=rr,$fn=40); 


//translate([0,0,rr/5]) sphere(r=rr,$fn=40); // tjoep(r*(1+i/div));
}
//}

module tjoep(r){
	translate([0,0,r/5]) {
 		sphere(r=r,$fn=40);
 		//translate([0,0,r])sphere(r=r/2,$fn=20);
	}
}
