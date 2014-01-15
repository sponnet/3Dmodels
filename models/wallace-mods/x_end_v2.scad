include <wallace2.scad>;

x_end2(0);
//translate([-60,0,0]) 
//x_end2(1);


module x_end2(motor = 0) mirror([(motor == 0) ? 1 : 0, 0, 0]) difference() {
	union() {
	
		if(motor > 0){
    	
		// clamp for holding cables
		for(side = [1]) mirror([0, side, 0]) 
		translate([(rod_size + bearing_size + 8 + 10)/2-46,(motor_casing/2)+3,0]){
			difference(){
					union(){
						cube([14,10,4]);
						translate([-1,10-2,0])cube([16,2,4]);
					}
					translate([7/2,0,-1])cube([7,11,4+2]);
			}
		}
		
      translate([-1-(motor_casing / 2 + rod_size + bearing_size + 8) / 2 - motor_casing, (x_rod_spacing + 8 + rod_size)/2 + 3, 2])
      {

       rotate([90, 0, 0]) 
        {


          // Motor plate
          translate([0,-2,0]) 
          {
            difference(){
              cube([motor_casing+3,2,(motor_casing / 2 + rod_size + bearing_size + 18)-12]);
              // cut off plate 45 degrees
			  translate([0,-1,4+2]) rotate([0,-45,0]) cube([motor_casing*2,2+2,40]);
            }
          }
          // Motor holder
          linear_extrude(height = 6) difference() {
            square([motor_casing + 40, x_rod_spacing + 8 + rod_size]);
            translate([motor_casing / 2, (x_rod_spacing + 8 + rod_size) / 2, 0]) {
              circle(motor_screw_spacing / 2);
              for(x = [1, -1]) for(y = [1, -1]) translate([x * motor_screw_spacing / 2, y * motor_screw_spacing / 2, 0]) circle(m3_size * da6, $fn = 6);
              translate([-(motor_casing * 1.5 - motor_screw_spacing), (motor > 1) ? (motor_casing / 2 - motor_screw_spacing) : 0, 0]) square([motor_casing*1, x_rod_spacing + 8 + rod_size]);
              translate([motor_casing+2,0,0])rotate([0,0,-45]) translate([-(motor_casing * 1.5 - motor_screw_spacing), (motor > 1) ? (motor_casing / 2 - motor_screw_spacing) : 0, 0]) square([motor_casing*1.5, x_rod_spacing + 8 + rod_size]);
            }
          }
          
          // Belt
          %translate([motor_casing / 2, (x_rod_spacing + 8 + rod_size) / 2, rod_size / 2 - 2 - bearing_size / 2 - 2 - idler_pulley_width / 2]) rotate([180, 0, 0]) linear_extrude(height = 5, convexity = 5) difference() {
            union() {
              circle(pulley_size / 2 + 2);
              translate([0, -pulley_size / 2 - 2, 0]) square([200.5, pulley_size + 4]);
              translate([200.5, 0, 0]) circle(pulley_size / 2 + 2);
            }
            circle(pulley_size / 2);
            translate([0, -pulley_size / 2, 0]) square([200.5, pulley_size]);
            translate([200.5, 0, 0]) circle(pulley_size / 2);
          }

        }
      }
}
		
    difference() {
			union() {
        // cylinders for bearings & Z-rod
				for(side = [1]) translate([side * (motor_casing / 4 + rod_size / 2), 0, 0]) cylinder(r=bearing_size / 2 + 3, $fn = 30,h=x_rod_spacing + 8 + rod_size);
        // connector between these cylinders
				//translate([-x_rod_spacing/2,-1*(bearing_size / 2 + 3), 0]) cube([motor_casing / 2 + rod_size,2*(bearing_size / 2 + 3),x_rod_spacing + 8 + rod_size]);
				
        // cylinders for x-rods
		rotate([90,0,90]){

		for(side = [1, -1]) 
          translate([side * (motor_casing / 4 + rod_size / 2), bearing_size / 2 + 3,-1/2*(x_rod_spacing + 8 + rod_size)-3]) 
          cylinder(r=bearing_size / 2 + 3, $fn = 30,h=x_rod_spacing + 8 + rod_size);

        // connector block between cylinders
				translate([-x_rod_spacing/2,0, -1/2*(x_rod_spacing + 8 + rod_size)-3]) cube([motor_casing / 2 + rod_size,2*(bearing_size / 2 + 3),x_rod_spacing + 8 + rod_size]);

        // bottom half cube to make bottom straight
				translate([-x_rod_spacing/2-(bearing_size / 2 + 3)-.25,0, -1/2*(x_rod_spacing + 8 + rod_size)-3]) 
          cube([motor_casing / 2 + rod_size + 2*(bearing_size / 2 + 3),0.5*2*(bearing_size / 2 + 3),x_rod_spacing + 8 + rod_size]);

  
      if(motor == 0)   {
      // idler bolt bearing guide
        rotate([0,90,0]){
          hull(){
            translate([0,0.5*(x_rod_spacing + 8 + rod_size), 0]) {
              cylinder(r=8,h=0.5*(x_rod_spacing + 8 + rod_size)+3,$fn=50); 
              translate([0,-8,0]) cylinder(r=15,h=0.5*(x_rod_spacing + 8 + rod_size)+3,$fn=20); 
            }
          }
		  
		              translate([0,0.5*(x_rod_spacing + 8 + rod_size), 0.5*(x_rod_spacing + 8 + rod_size)]) {
			hull(){
					  cylinder(r=15,h=3,$fn=50); 
              translate([0,-8,0]) cylinder(r=15,h=3,$fn=50); 
			  }
}
		  
		  
        }
      }

        }

   

		}

			
			// clamp spacer 
      cube([motor_casing / 2 + rod_size, 3,2+2*(x_rod_spacing + 8 + rod_size)], center = true);

			// bearing hole
      translate([(motor_casing / 4 + rod_size / 2), 0, -1]) cylinder(h=2+x_rod_spacing + 8 + rod_size,r=bearing_size / 2 - .5, $fn = 30);

      // nut hole
			translate([-(motor_casing / 4 + rod_size / 2), 0, -1]) cylinder(h=2+x_rod_spacing + 8 + rod_size,r=rod_nut_size * 6/14, $fn = 6);

      if(motor == 0)   {

        // idler bolt mount - hole
        rotate([90,0,0]){
          translate([0,0.5*(x_rod_spacing + 8 + rod_size), -50]) 
            #cylinder(r=7.6/2,h=50); 
        }
       }

	   // smooth rod holes
			rotate([90,0,90]){
         for(side = [1, -1]) 
         translate([side * (motor_casing / 4 + rod_size / 2), bearing_size / 2 + 3,-1/2*(x_rod_spacing + 8 + rod_size)]) 
         #cylinder(r=rod_size/2 + 0.125, $fn = 30,h=x_rod_spacing + 8 + rod_size+10);
      }
			
		}


		
	}

  // z-screw hole
  for (m=[0,1]){
   mirror([0,m,0]){
    if(motor == 0) translate([rod_size/2+2,1.7-1*0.5*(x_rod_spacing + 8 + rod_size),-1]) cylinder(r=4/2-0.1,h=50);
    //if(motor == 0) translate([rod_size/2+2,1.7-1*0.5*(x_rod_spacing + 8 + rod_size)+12.1,-1]) cylinder(r=4/2-0.1,h=50);
   }
  }

  // M8 nut cap
	translate([-(motor_casing / 4 + rod_size / 2), 0, 5]) rotate(90) #cylinder(r = rod_nut_size / 2, h = x_rod_spacing + 8 + rod_size, $fn = 6);

  // smooth rod display
	translate([(motor_casing / 4 + rod_size / 2), 0, 5]) %rotate(180 / 8) #cylinder(r = rod_size * da8, h = 200, center = true, $fn = 8);
}