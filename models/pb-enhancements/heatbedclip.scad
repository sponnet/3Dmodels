
h=25;
d=15;
hole = 4;
blokhoogte = 0;

module pennedop() {
$fs=0.1;
	difference() {
		cylinder(h+blokhoogte,d/2,d/2);
		translate([0,0,-0.1])cylinder(h+blokhoogte+2,hole/2,hole/2);
		


	}


}

pennedop();
