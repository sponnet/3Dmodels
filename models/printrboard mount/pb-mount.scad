width = 8;
height = 4;
tol=0.1;

rod_distance = 60;
hole_distance = 92;

// dimensions of ziptie hole
ziptie_x = 2;
ziptie_y = 5;

difference(){
  union(){
    cube([hole_distance+8,width,height]);
    bump();
    translate([hole_distance-8,0,0]) bump();
  }

  ziptiehole();
  translate([8,0,0])ziptiehole();

  translate([rod_distance,0,0]) {
    ziptiehole();
    translate([8,0,0])ziptiehole();
  }

  translate([hole_distance,0,0]) {
    ziptiehole();
   }

}

module ziptiehole(){
  translate([3,(width-ziptie_y)/2,-tol]) #cube([ziptie_x,ziptie_y,height+2*tol]);
}
module bump(){ 
translate([3+width/2-1+ziptie_x,width/2,height]) cylinder(r=width/2-1,h=2);

}
