include <graber.scad>;

difference(){
  
  union(){
    // motor clamps
    motor_clamp();
    translate([0,100,0]) mirror([0,1,0]) motor_clamp();

    // upper grid
    linear_extrude(height = 3) zigzag(100,100,6);

    // pencil holder
    translate([motor_casing/2,50,0]){
      cylinder(r=17/2,h=50,$fn=6);
      cylinder(r=40/2,h=3,$fn=4);
    }

    // vertical shroud
    translate([100-4,(100-10)/2,0]){
      cube([4,10,30]);
    }

  }

  // hole in pencil holder
  translate([motor_casing/2,50,0]) difference(){
    cylinder(r=10/2 + 1,h=50);
  }  

}



module motor_clamp(){
  rotate([90,0,0]){
    linear_extrude(height = 4) difference() {
              square([motor_casing , x_rod_spacing + 8 + rod_size]);
              translate([motor_casing / 2, (x_rod_spacing + 8 + rod_size) / 2, 0]) {
                translate([0,2,0]){
                  circle(motor_screw_spacing / 2);
                  for(x = [1, -1]) for(y = [1, -1]) translate([x * motor_screw_spacing / 2, y * motor_screw_spacing / 2, 0]) circle(m3_size * da6, $fn = 20);
                  translate([-(motor_casing * 1.5 - motor_screw_spacing), (motor > 1) ? (motor_casing / 2 - motor_screw_spacing) : 0, 0]) #square([motor_casing*1, x_rod_spacing + rod_size]);

                }
              }
            }
  }
  difference(){
    translate([motor_casing,-4,0])cube([4,60,motor_casing+1]);
    translate([motor_casing-1,5+motor_casing,10]) rotate([45,0,0]) #cube([40,90,70]);
  }

}

module zigzag(h,w,c){
  radius = (w+h)/4/c/7;
  zigzag_half(w,h,c,radius);
  mirror([0,1,0]) translate([0,-w,0]) zigzag_half(w,h,c,radius);
  hull(){
    translate([radius,radius,0]) circle(radius);
    translate([h-radius,radius,0]) circle(radius);
  }
  hull(){
    translate([h-radius,radius,0]) circle(radius);
    translate([h-radius,w-radius,0]) circle(radius);
  }
  hull(){
    translate([h-radius,w-radius,0]) circle(radius);
    translate([radius,w-radius,0]) circle(radius);
  }
  hull(){
    translate([radius,w-radius,0]) circle(radius);
    translate([radius,radius,0]) circle(radius);
  }
}

module zigzag_half(w,h,c,radius){
  for (i = [0:c]){
        hull(){
          translate([radius,radius+((w-2*radius)/c)*i,0]){
            circle(radius);
          }
          
          translate([radius+((h-2*radius)/c)*(0+i),radius,0]){
            circle(radius);
          }
        }
        
        hull(){
          translate([h-radius,radius+((w-2*radius)/c)*i,0]){
            circle(radius);
          }
          translate([radius+((h-2*radius)/c)*(0+i),w-radius,0]){
            circle(radius);
          }
        }
        
  }
}