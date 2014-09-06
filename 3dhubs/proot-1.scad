module w(rad,h){

translate([0,0,h*0.1])
rotate_extrude(convexity = 10, $fn = 50)
translate([rad-(h*0.1), 0, 0])
circle(r = (h*0.1), $fn = 50);

translate([0,0,h*0.1])
cylinder(r=rad,h=h*0.8, $fn = 50);

cylinder(r=rad-h*0.1,h=h, $fn = 50);

translate([0,0,h-h*0.1])
rotate_extrude(convexity = 10, $fn = 50)
translate([rad-(h*0.1), 0, 0])
circle(r = (h*0.1), $fn = 50);

//	cylinder(r=10,h=6);
}

difference(){
 union(){
  w(10,6);
  translate([25,0,0]) w(10,6);
  cylinder(r=14/2,h=11,$fn=50);
  cylinder(r=14/3,h=11+6,$fn=50);
 }
  translate([0,0,-1]) cylinder(r=5.6/2+0.5,h=19,$fn=50);
  translate([25,0,-1])   cylinder(r=14/3+0.1,h=11+6,$fn=50);


}

