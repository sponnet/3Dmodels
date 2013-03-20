tol=0.1;
$fn=40;
width = 17;
length=22;
//height = 5;
switch_plate_length=2;
switch_plate_height=3;

for(i = [ 0 : 1 : 5 ])
{
//translate([0,25*i,0]) stopswitch_holder(2*i/5,5*i/5,4+i/5);
}

stopswitch_holder(1.2,5,5);

module stopswitch_holder(ziptie_w=1.2,ziptie_h=4,height=5){

	rotate([0,0,90])
	difference() {
		union() {
			translate([-width/2,-length/2,-height]) cube(size=[width,length,height]);
			translate([-width/2,-length/2,0]) cube(size=[width,switch_plate_length,switch_plate_height]);
			// cone
			translate([0,0,-height]) cylinder(r=6.5+tol,h=height+switch_plate_height);
		}
		
		translate([0,0,-height-tol]) #cylinder(r=4+tol,h=height+switch_plate_height+2*tol);
		//translate([0,0,-1]) #cylinder(r=5+tol,h=6);

    // Ziptie holes
    translate([0,-length/2-tol,-ziptie_h+switch_plate_height-1.5])
    for(i = [ 0,-90 ]){
        rotate([i,0,0]){
          // gaten zipties
          translate([-10/2-ziptie_w/2,0,0]) cube(size=[ziptie_w,switch_plate_length+2*tol+3,ziptie_h,]);
          translate([10/2-ziptie_w/2,0,0]) cube(size=[ziptie_w,switch_plate_length+2*tol+3,ziptie_h,]);
        }
    }
		// extra balkje onder zipties
		translate([-10/2,-length/2+switch_plate_length,switch_plate_height-2.5]) rotate([0,90,0]) #cube(size=[3.2,2.2,10]);
		

		
		// klem gat
		translate([(-8-tol)/2,2,-height-tol]) #cube(size=[8+tol,length/2+tol,height+2*tol]);

		// weggommen halve cirkel geleidingsbus
		translate([(-7-tol),2,0]) cube(size=[14+2*tol,12/2+tol,switch_plate_height+2*tol]);

		// spleet voor ziptie achter rod
		//translate([(-width/2-tol),-length/2+switch_plate_length,0]) #cube(size=[width+2*tol,1,switch_plate_height+2*tol]);

		// schroefgat
		translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) #cylinder(r=1.5+tol*2,h=width+2*tol);
		translate([-width/2-tol,6,-height/2]) rotate([0,90,0]) rotate([0,0,30]) #cylinder($fn=6,r=3.12,h=2);
		


	}
}
