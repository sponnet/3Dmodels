cd = 35;
ce = 20;
difference(){
cube([cd,cd,ce]);
translate([(cd-ce)/2,5,0]) cube([cd,cd-20,ce]);

translate([(cd-ce)/2+3,0,0]) cube([cd,cd-20,ce]);

translate([2,cd-5,ce/2]) rotate([0,90,0])#cylinder(r=4.03,h=40,$fn=20);
}
