

for ( y = [0 : 2] )

translate([0,y*40,0])

for ( x = [0 : 5] ){

translate([y*1/2*40 + x*40*0.9,0,0]){
rotate([0,0,30])difference(){
translate([0,0,0])#cylinder($fn=6,h=6,r1=20,r2=20);
translate([0,0,0]) cylinder($fn=3,h=6,r1=40,r2=0);
}
}
}
