use <bearing.scad>
bearing_diameter = 15; 
shift = 2;

a(18,45,1);
translate([-47,0,0]) mirror([1,0,0])  {
	a(18,45,0);
	translate([-64,5,0]) hood(2);
}
module hood(h){
	difference(){
		union(){
			translate([40,(rod_distance+h)/2,0]) rotate([0,0,45]) cylinder(r=35/2+1+10,h=h,$fn=4);
			for(i = [0:4]){
				translate([40,(rod_distance+h)/2,-1]) rotate([0,0,45+90*i])translate([sqrt((31*31)*2)/2,0,0]) cylinder(r=2-0.2,h=h+3,$fn=4);
			}
		}
		translate([40,(rod_distance+h)/2,-1]) cylinder(r=1.6,h=6);
	}
}

module a(h,rod_distance,motor) {
	intersection(){
		difference(){
			union(){
				// main block
				hull(){
					cube([60,rod_distance+h,h/2]);
					translate([60,h/2,h/2]) rotate([-90,90,90]) cylinder(r=h/2,h=60);
					translate([60,h/2+rod_distance,h/2]) rotate([-90,90,90]) cylinder(r=h/2,h=60);
					}
				// bearing block
				translate([0,shift,0])
				translate([10,(rod_distance+h)/2,h-0.5]) rotate([0,0,180-90]) vertical_bearing_base(25);

				// Z-screw block				
				translate([0,shift,0])
				translate([10-18,(rod_distance+h)/2,0])
				hull(){
					cylinder(r=13/2,h=5+5,$fn=6);
					translate([10,0,0]) cylinder(r=13/2,h=5+5,$fn=6);
				}
			}

			// pushfit holes
			translate([45,h/2,h/2]) rotate([-90,90,90])#pushfit_rod(8,50);
			translate([45,(h/2)+rod_distance,h/2]) rotate([-90,-90,90]) pushfit_rod(8,50);

			// Z-screw holes				
				translate([0,shift,0])
				translate([10-18,(rod_distance+h)/2,5]) {
					cylinder(r=8.7/2,h=h,$fn=6);
					translate([0,0,-6])cylinder(r=5.2/2,h=h,$fn=20);
				}

			
			translate([0,shift,0]) {
			
				// belt holes
				translate([-10,(rod_distance+h)/2-7-5,(h-12)/2])cube([50,6,12]);
				translate([-10,(rod_distance+h)/2-7+8+5,(h-12)/2])cube([50,6,12]);

				if (motor==1){
					// nema 17 holes ( center & screws )
					translate([40,(rod_distance+h)/2,-1]) rotate([0,0,45]) cylinder(r=35/2+1,h=h+2,$fn=4);
					translate([40,(rod_distance+h)/2-35/2/2,4]) cube([h*2,35/2,h-4+1]);
					for(i = [0:4]){
						translate([40,(rod_distance+h)/2,-1]) rotate([0,0,45+90*i])translate([sqrt((31*31)*2)/2,0,0]) cylinder(r=2,h=h+2,$fn=4);
					}
				}else{
					// nema 17 holes ( center & screws )
					translate([40,(rod_distance+h)/2,2]) rotate([0,0,45]) cylinder(r=35/2+1,h=h+2,$fn=4);
					translate([40,(rod_distance+h)/2-35/2/2,4]) cube([h*2,35/2,h-4+1]);
					for(i = [0:4]){
						translate([40,(rod_distance+h)/2,-1]) rotate([0,0,45+90*i])translate([sqrt((31*31)*2)/2,0,0]) cylinder(r=2,h=h+2,$fn=4);
						translate([40,(rod_distance+h)/2,-1]) cylinder(r=1.6,h=6);
					}
				}

				// bearing block holes
				translate([10,(rod_distance+h)/2,h]) rotate([0,0,180]){
					vertical_bearing_holes(25);
					translate([0,0,-h-2]) rotate([0,0,45]) cylinder(r=8/2+1,h=h+45+2,$fn=40);
				}
			}
			// temp patch : lose some material 
			translate([0,rod_distance+h-3,0]) #cube([30,3,h]);
		}
		translate([0,(rod_distance+h)/2,0]) cylinder(r=sqrt((rod_distance+h)*(rod_distance+h)+60*60),h=100,$fn=4);
	}
}


module pushfit_rod(diameter,length){
 cylinder(h = length, r=diameter/2, $fn=30);
 translate(v=[0,-diameter/4,length/2]) cube(size = [diameter,diameter/2,length], center = true);
 translate(v=[0,-diameter/2-2,length/2]) cube(size = [diameter,1,length], center = true);
}

