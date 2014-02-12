difference(){
union(){
cylinder(r=4.61,h=7,$fn=6);
translate([0,0,7])cylinder(r=3.6,h=57,$fn=30);
}
cylinder(r=1.25,h=15,$fn=30);
}

intersection(){
translate([0,0,57+7-4.61*2+0.75])sphere(r=4.61*2,$fn=50);
translate([0,0,7+57])cylinder(r=3.6,h=570,$fn=30);
}
