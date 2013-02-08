height = 22;
spool_width = 57;
length = 135;
thickness = 5;
bearing_size = 22;
screw_size = 7.7;
nut_size = 9;

da6 = 1 / cos(180 / 6) / 2;
da8 = 1 / cos(180 / 8) / 2;
da12 = 1 / cos(180 / 12) / 2;

cx=spool_width+thickness*2+1;
cy=length-50;
cx2 = spool_width;
cy2 = length+1;

module base() {
union() {
difference() {
	linear_extrude(height = height, convexity = 5)
	difference() {
		minkowski() {
			square([spool_width, length - thickness * 2], center = true);
			circle(thickness);
		}
		square([spool_width, length - thickness * 2], center = true);


	}
	for(end = [1, -1]) translate([0, end * (length / 2 - thickness - bearing_size / 2 - 1), height - bearing_size / 2]) rotate([90, 0, 90]) {
		cylinder(r = screw_size * da6, h = spool_width + thickness * 3,center = true, $fn = 100);
		for(side = [0, 1]) mirror([0, 0, side]) translate([0, 0, spool_width / 2 + thickness - 2]) cylinder(r = nut_size / 2, h = spool_width + thickness * 3,center = false, $fn = 6);		




	}
	translate([-cx/2,-cy/2,5]) cube([cx,cy,50]);
	translate([-cx2/2,-cy2/2,5]) cube([cx2,cy2,40]);
}
	translate([-spool_width/2,length/2-(thickness/2),5])	rotate([90, 0, 90]) cylinder(spool_width,thickness/2,thickness/2,$fn=100);
	translate([-spool_width/2,-1*(length/2-(thickness/2)),5])	rotate([90, 0, 90]) cylinder(spool_width,thickness/2,thickness/2,$fn=100);

}
}

h=15;
d=7.5;
splitwidth=1;
holew=2.8;
module splitpen() {
	$fn=100;
	difference() {
		union() {
			cylinder(h,d/2,d/2);
			cylinder(1,d/2+1.5,d/2+1.5);
		}
		translate([-d,-splitwidth/2,h-11]) cube([d*2,splitwidth,12]);
		translate([0,0,h-10]) cylinder(10+1,holew/2,holew/2*1.1);
		translate([0,0,h-4]) cylinder(4+1,holew/2,holew/2*1.5);


	}
}

//base();
for(end = [-2,-1,1,2]) translate([0,d*2*end,0]) splitpen();


