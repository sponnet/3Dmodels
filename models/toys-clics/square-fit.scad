$fn=30;
tol=0.2;
difference(){
  union(){
    cube([26-tol,26-tol,8],center=true);
    cylinder(r1=13,r2=10,h=10);
  }
  translate([0,0,-5])
  for ( i = [0 : 4] )
  {
    rotate( i * 360 / 4,[0,0,1])
    translate([10,-3,0])
    #cube([1,30,10]);
  }
}
translate([0,0,40]) cylinder(r1=10,r2=15,h=5);
for ( i = [0 : 6] )
{
    rotate( i * 360 / 6,[0,0,1])
    translate([0, 10, 0])
    difference(){
      union(){
        cylinder(r = 2.8,h=50);
      }
      cylinder(r = 3-2,h=50+1);
  }
}




