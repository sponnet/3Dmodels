cd = 35;
ce = 20;
rotate([0,90,0])difference(){
cube([10,20,13]);
translate([5,5,0])#cylinder(r=2.5,h=20);
translate([-1,15,7]) rotate([0,90,0])#cylinder(r=4,h=20);
translate([0,10,7-3]) #cube([10,15,6]);
}
