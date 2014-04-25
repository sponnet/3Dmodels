$fn=20;
difference(){
 union(){
translate([-21,-4,0])cube([42,4+6,2],center=false);
//translate([-6,4,0]) cube([12,6,2]);
translate([-10,2,0]) cube([20,4,9+20]);
}
translate([-32/2,0,0]) cylinder(r=3.7/2,h=4);
translate([32/2,0,0]) cylinder(r=3.7/2,h=4);

rotate([90,0,0]) translate([-5,2.5+2+20,-10])cylinder(r=1.5,h=100,$fn=20);
rotate([90,0,0]) translate([5,2.5+2+20,-10])cylinder(r=1.5,h=100,$fn=20);
}
