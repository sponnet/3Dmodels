d=10.8;
h=12;
db=28;



pad = 0.1;	// Padding to maintain manifold
ch = 10;
cr = 16;
ct = 2;
r = 4;
smooth = 30;	// Number of facets of rounding cylinder

$fn = smooth;


difference(){
union(){

 hull(){
  translate([0,0,h/2-2]) sphere(r=d/2+4);
  cylinder(r=d/2+5,h=1);
 }

cylinder(r=db/2,r2=db/2-1,h=2);
}


// Inside Fillet
mirror([0,0,1]) translate([0,0,-4])difference() {
	rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r+pad,ct-pad,0])
			square(r+pad,r+pad);
	rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r,ct+r,0])
			circle(r=r,$fn=smooth);
	
	translate([0,0,-4]) rotate_extrude(convexity=10,  $fn = smooth)
		translate([cr-ct-r,ct+r,0])
			circle(r=r,$fn=smooth);

}


 translate([0,0,d/2+2]) hull(){
  translate([0,0,20]) sphere(r=d/2);
  translate([0,0,-1]) #sphere(r=d/2);
 }


translate([0,0,-40])cylinder(r=40,h=40);

}

