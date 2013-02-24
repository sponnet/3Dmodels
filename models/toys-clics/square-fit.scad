cube([26,26,8],center=true);
for ( i = [0 : 6] )
{
    rotate( i * 360 / 6,[0,0,1])
    translate([0, 10, 0])
    difference(){
      cylinder(r = 3,h=i*3+40,$fn=10);
      cylinder(r = 3-1,h=i*3+40+1,$fn=10);
  }
}


