//
// Extruder-x
//
// GNU GPL v2
// pawel.ratanczuk@gmail.com
// printerzero.blogspot.com
//
// Universal direct drive extruder, support nema17 and nema23 motors, independent from drive gear diameter 
//
// Refined or reused components:
// springs.scad - taken from OpenSCAD example example020.scad and standard OPENSCAD libraries as includes http://www.openscad.org/
// Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad - taken from droftarts design http://www.thingiverse.com/thing:16627
// Fan_60mm_x_25mm_0v0.scad - taken from MiseryBot http://www.thingiverse.com/thing:8063


use<MCAD/hardware.scad>;
use<addons/Fan_60mm_x_25mm_0v0.scad>
use<addons/Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>
use<addons/springs.scad>
include<MCAD/stepper.scad>;
include<MCAD/bearing.scad>;
include<MCAD/boxes.scad>;
include<MCAD/nuts_and_bolts.scad>;
include<configuration.scad>;




//visualization
if( display_mode == "print")rotate([180,0,0])
{
	rotate([0,-90,0])
	{
		extruder_base (extruder_base_width,extruder_base_length,extruder_base_thickness, extruder_base_mount_hole_diameter, filament_diameter);
		extruder_back_plate(extruder_base_width, extruder_base_length, extruder_motor_type, filament_diameter, extruder_base_thickness);
		extruder_fan_mount(extruder_base_width, extruder_base_length, extruder_fan_mount_thickness,extruder_base_thickness);
	}
	if( extruder_motor_type == Nema17) translate([extruder_base_width,-extruder_base_thickness+extruder_base_length/2,-26.1985]) rotate([135,0,90]) extruder_bearing_mount_nema17(extruder_base_width, extruder_base_length , extruder_base_thickness);
	if( extruder_motor_type == Nema23) translate([extruder_base_width+5,2-extruder_base_thickness+extruder_base_length/2,-42.568]) rotate([135,0,90]) extruder_bearing_mount_nema23(extruder_base_width, extruder_base_length , extruder_base_thickness);

    //ball bearing rood
    translate([20,-5,7]) rotate([ 0,0,0]) cylinder(h = extruder_base_width-2*extruder_base_thickness-2, r=(8/2), center = true, $fs=0.1);
}

if(display_mode == "visualization")
{
	//base m4 nuts
	//base mount
		translate([0,-25,2.5-extruder_base_thickness/2]) color( "silver") 
		difference(){
			nutHole(M4);
			boltHole(M4,length=10);
		}
		translate([0,25,2.5-extruder_base_thickness/2]) color( "silver") 
		difference(){
			nutHole(M4);
			boltHole(M4,length=10);
		}
		//spring mount
		if( extruder_motor_type == Nema17)
		{	
			translate([-extruder_base_thickness/2+3, extruder_base_length/2 + 5, -25]) rotate([-135,0,0])	color( "silver") screw(42, true,renderscrewthreads = true, screwsize = M4);
			translate([-extruder_base_thickness/2+3, extruder_base_length/2 -22 , 1]) rotate([45,0,0])		difference()
			{
				color( "silver") nutHole(M4);
				boltHole(M4,length=10);
			}
		}
		if( extruder_motor_type == Nema23)
		{	
			translate([-extruder_base_thickness/2+3, extruder_base_length/2 + 10.5, -40]) rotate([-135,0,0])	color( "silver") screw(42, true,renderscrewthreads = true, screwsize = M4);
			translate([-extruder_base_thickness/2+3, extruder_base_length/2  -16, -13]) rotate([45,0,0])		difference()
			{
				color( "silver") nutHole(M4);
				boltHole(M4,length=10);
			}
		}
		
	//fan, source http://www.thingiverse.com/thing:8063
	color("YellowGreen")translate([(extruder_base_width/2)+0.5,-extruder_fan_mount_thickness-extruder_base_length/2,-motor_size/2]) rotate([0,-90,90]) scale([1-1/3,1-1/3,0.35]) fan_60mm_x_25mm();
	//fan nuts
	translate([-extruder_base_thickness/2, -extruder_base_length/2 + extruder_fan_mount_thickness +0.1, -motor_size/2-32.5/2]) rotate([90,32.5,0]) color( "silver") nut();
	translate([-extruder_base_thickness/2, -extruder_base_length/2 + extruder_fan_mount_thickness +0.1, -motor_size/2+32.5/2]) rotate([90,32.5,0]) color( "silver") nut();
	//fan screws
translate([-extruder_base_thickness/2, -extruder_base_length/2 - 8.5, -motor_size/2-32.5/2]) rotate([90,32.5,0])	color( "silver") screw(14.5, true,renderscrewthreads = true, screwsize = M3);
translate([-extruder_base_thickness/2, -extruder_base_length/2 - 8.5, -motor_size/2+32.5/2]) rotate([90,32.5,0])	color( "silver") screw(14.5, true,renderscrewthreads = true, screwsize = M3);

	//motor screws
	//left bottom


translate([extruder_base_thickness+0.25,-5.5,-motor_size/2]) rotate([ 0,-90,0]) translate([ motor_holes_distance/2,-motor_holes_distance/2,0]) 	{
		color( "silver") screw(6, true,renderscrewthreads = true, screwsize = motor_screw_size);
		color( "silver") washer(washerdiameter = 2*motor_screw_size+1.5);
	}
	//left top
translate([extruder_base_thickness+0.25,-5.5,-motor_size/2]) rotate([ 0,-90,0]) translate([ -motor_holes_distance/2,-motor_holes_distance/2,0])	{
		color( "silver") screw(6, true,renderscrewthreads = true, screwsize = motor_screw_size);
		color( "silver") washer(washerdiameter = 2*motor_screw_size+1.5);
	}
	//right bottom
translate([extruder_base_thickness+0.25,-5.5,-motor_size/2]) rotate([ 0,-90,0]) translate([ motor_holes_distance/2,motor_holes_distance/2,0])	{
		color( "silver") screw(6, true,renderscrewthreads = true, screwsize = motor_screw_size);
		color( "silver") washer(washerdiameter = 2*motor_screw_size+1.5);
	}
	//right top
translate([-(extruder_base_thickness+1),-5.5,-motor_size/2]) rotate([ 0,-90,0]) translate([ -motor_holes_distance/2,motor_holes_distance/2,0])	{
		color( "silver") screw(20, true,renderscrewthreads = true, screwsize = motor_screw_size);
		color( "silver") washer(washerdiameter = 2*motor_screw_size+1.5);
	}
	
	//motor
	translate([11.5,-4.5-(filament_diameter/2),-motor_size/2]) rotate([0,90,0])color("Gray") motor(extruder_motor_type, NemaMedium);
	//pulley

	color("silver") translate([ 7,-4.5-(filament_diameter/2),-motor_size/2]) rotate([180,90,0]) pulley ( "MXL" , 8 , 0.508 , 1.321, pulley_b_dia = 9, teeth = 16,profile = 1, motor_shaft = 5,pulley_b_ht=5,pulley_t_ht=7,retainer=1,retainer_ht=0.5);
color("SteelBlue") {
	extruder_base (extruder_base_width,extruder_base_length,extruder_base_thickness, extruder_base_mount_hole_diameter, filament_diameter);
	extruder_back_plate(extruder_base_width, extruder_base_length, extruder_motor_type, filament_diameter, extruder_base_thickness);
	extruder_fan_mount(extruder_base_width, extruder_base_length, extruder_fan_mount_thickness,extruder_base_thickness);
}
	 	if( extruder_motor_type == Nema23)	extruder_bearing_mount_nema23(extruder_base_width, extruder_base_length , extruder_base_thickness);
	 	if( extruder_motor_type == Nema17)	extruder_bearing_mount_nema17(extruder_base_width, extruder_base_length , extruder_base_thickness);
}


module extruder_base(x, y, z, mount_hole_diameter, filament_diameter) 
{
	translate([0,0,z/2]) difference()
	{
		//base plte
		union()
		{
			//base
			roundedBox( [x, y, z], 5, true);
			// spring mount support
			if( extruder_motor_type == Nema17)
			{
				translate([-2,14,-0.25-1])
				hull() 
				{
					difference()
					{
						translate([0,-3,0]) rotate([ 0,90,0]) cylinder(r = 5, h=x/2, center=true, $fn=100);
						translate([0,-3,5])cube([x+0.1,10,10],center=true); 
					}
					difference()
					{
						translate([0,2,0]) rotate([ 0,90,0]) cylinder(r = 5, h=x/2, center=true, $fn=100);
						translate([0,2,5])cube([x+0.1,10,10],center=true); 
					}
				}			
			}
		}
		//mount holes
		union()
		{
			//left hole
			translate([ 0,-25,0]) cylinder(h = z+0.1, r=mount_hole_diameter/2, center = true, $fs=0.1);
			//nut hole
			translate([0,-25,-0.1-extruder_base_thickness/2])nutHole(M4, tolerance=0.1);

			//right hole
			translate([ 0,25,0]) cylinder(h = z+5, r=mount_hole_diameter/2, center = true, $fs=0.1);
			//nut hole
			translate([0,25,-0.1-extruder_base_thickness/2])nutHole(M4, tolerance=0.1);

			//JHEAD hole
			translate([ 0,0,1]) cylinder(h = z, r=16/2+1, center = true, $fs=0.1);
			translate([ 0,0,-21]) #cylinder(h = 90, r=1.75/2+0.2, center = flse, $fs=0.1);

			if( extruder_motor_type == Nema17)
			{			
				//spring mount hole
				union()
				{
					hull(){
						rotate([45,0,0]) translate([ 0,8,-10]) #cylinder(h=30, r=2.1, center=true, $fs=0.1 );
						rotate([55,0,0]) translate([ 0,8,-10]) #cylinder(h=30, r=2.1, center=true, $fs=0.1 );
					}

					hull(){
					//nut hole
					translate([0,13.5,-2.5]) rotate([45,0,0]) 
					hull()
					{
						#nutHole(M4, tolerance=0.05);
						translate([0,0,8]) #nutHole(M4, tolerance=0.05);					
					}
					//nut hole
					translate([0,13.5,-2.5]) rotate([55,0,0]) 
					hull()
					{
						#nutHole(M4, tolerance=0.05);
						translate([0,0,8]) #nutHole(M4, tolerance=0.05);					
					}

					}
				}
			}				
		}
	}
}

module extruder_back_plate(x, y, motor_type, filament_diameter, wall_thickness)
{
	//sprint holder
	if( extruder_motor_type == Nema23)
	{	
		difference()
		{
			translate ([0.5,29,-14]) rotate([-45,0,0]) cube ([14, 15, 15],center=true);
			translate ([0.5,36.25,-14]) rotate([0,0,0]) cube ([15, 16, 30],center=true);
			translate([ 0,25,-14]) rotate([45,0,0]) cylinder(h=80, r=2.1, center=true, $fs=0.1 );
			translate([0,24,-13]) rotate([45,0,0]) hull()
				{
					nutHole(M4, tolerance=0.05);
					translate([0,0,8]) nutHole(M4, tolerance=0.05);					
				}
		}
	}				

			
	translate([0,0,]) difference()
	{
		//plate
		union()
		{
			translate([0,0,-motor_size/2]) roundedBox( [x, y, motor_size], 5, true);
		}
		union()
		{
			//filament hole
			//-0.25+4.5+(filament_diameter/2)
			if(display_mode == "visualization") #translate([ 0,0,-motor_size/2]) cylinder(h = motor_size+0.1, r=(filament_diameter/2)+0.25, center = true, $fs=0.1);
			if(display_mode == "print") translate([ 0,0,-motor_size/2]) cylinder(h = motor_size+0.1, r=(filament_diameter/2)+0.25, center = true, $fs=0.1);
			
			//motor holes
			translate([ 0,0.25-4.5-(filament_diameter/2),0]) extruder_motor_holes(x, y, motor_size, motor_holes_diameter, motor_holes_distance, motor_center_circle);


			//cut left
			translate([0,0,0]) union()
			{
        		translate ([-wall_thickness/2,-4-(motor_size/2),-motor_size/2]) cube ([x-wall_thickness+0.1, motor_size, motor_size+0.1],center=true);
			}
			
			//cut center
       		translate ([-x/2+wall_thickness/2,0,-motor_size/2]) cube ([wall_thickness+0.1, motor_size, motor_size+0.1],center=true);
       		
			translate ([-wall_thickness/2,0,-motor_size/2]) cube ([x-wall_thickness+0.1, motor_center_circle, motor_center_circle],center=true);
			
			//cut right
			translate([0,0,0]) union()
				{
					//front
        			translate ([-wall_thickness/2,4+(motor_size/2),-motor_size/2]) cube ([x-wall_thickness+0.1, motor_size, motor_size+0.1],center=true);
        			//back
					translate ([x/2-wall_thickness/2,(motor_size),-motor_size/2]) cube ([wall_thickness+0.1, motor_size, motor_size+0.1],center=true);
				}
		}
	}
}

module extruder_motor_holes(x, y, motor_size, motor_holes_diameter, motor_holes_distance, motor_center_circle)
{

	//center hole
	hull() 
	{
		rotate([ 0,90,0]) translate([ motor_size/2,-3,0]) cylinder(h = x+0.1, r=motor_center_circle/2, center = true, $fs=0.1);
		rotate([ 0,90,0]) translate([ motor_size/2,3,0]) cylinder(h = x+0.1, r=motor_center_circle/2, center = true, $fs=0.1);
	}
	//screw mounts
	hull() 
	{
		translate([0,-3,-motor_size/2]) rotate([ 0,90,0]) translate([ -motor_holes_distance/2,-motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
		translate([0,3,-motor_size/2]) rotate([ 0,90,0]) translate([ -motor_holes_distance/2,-motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
	}
	hull() 
	{
		translate([0,-3,-motor_size/2]) rotate([ 0,90,0]) translate([ motor_holes_distance/2,-motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
		translate([0,3,-motor_size/2]) rotate([ 0,90,0]) translate([ motor_holes_distance/2,-motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
	}
	hull() 
	{
		translate([0,-3,-motor_size/2]) rotate([ 0,90,0]) translate([ -motor_holes_distance/2,motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
		translate([0,3,-motor_size/2]) rotate([ 0,90,0]) translate([ -motor_holes_distance/2,motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
	}
	hull() 
	{
		translate([0,-3,-motor_size/2]) rotate([ 0,90,0]) translate([ motor_holes_distance/2,motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
		translate([0,3,-motor_size/2]) rotate([ 0,90,0]) translate([ motor_holes_distance/2,motor_holes_distance/2,0]) cylinder(h = motor_size+0.1, r=motor_holes_diameter/2, center = true, $fs=0.1);
	}
}

module extruder_bearing_mount_nema17(x, y, wall_thickness)
{
	translate([0-0.2, 21,-21])
	{
	
		difference()
		{
			color("SteelBlue") translate([0,1,-6]) cube([x-2*wall_thickness-0.4,32,30],center=true); 
			//ball bearing
			union()
			{
				hull() 
				{	
					translate([0,-15,0])rotate([ 0,90,0])  cylinder(h = 7.25, r=(22/2)+0.5, center = true, $fs=0.1);
					translate([0,-8,0])rotate([ 0,90,0])  cylinder(h = 7.25, r=(22/2)+0.5, center = true, $fs=0.1);
				}
				hull() 
				{   
                    echo("Ball bearing rod length:", (x-2*wall_thickness - 3));
					translate([0,-9,0]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness - 2.5, r=(8/2)+0.2, center = true, $fs=0.1);
					translate([0,-15,0]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness - 2.5, r=(8/2)+0.2, center = true, $fs=0.1);
				}
				//M4 mount hole
				translate([0,-11.5,-16.5 ]) rotate([0,90,0])  cylinder(h =x-2*wall_thickness, r=M3/2+0.1, center = true, $fs=0.1);
				
				//M4 spring hole
				color("SteelBlue") hull()
				{
				translate([0,8,4 ]) rotate([45,0,0])  cylinder(h =30, r=2.2, center = true, $fs=0.1);
				translate([0,12,10 ]) rotate([45,0,0])  cylinder(h =30, r=2.2, center = true, $fs=0.1);
				
				}
				
				//cut top right corner
				color("SteelBlue") rotate([45,0,0]) translate([0,-4,-24]) cube([x-2*wall_thickness,40,30],center=true);

				//cut bottom right corner
				color("SteelBlue") rotate([135,0,0]) translate([0,-8,-30]) cube([x-2*wall_thickness,40,30],center=true);

				//cut bottom left corner
				color("SteelBlue") rotate([135,0,0]) translate([0,18,5]) cube([x-2*wall_thickness,10,10],center=true);

				//cut top left corner
				color("SteelBlue") translate([0,-18,-22.5]) rotate([135,0,0])  cube([x-2*wall_thickness,10,10],center=true);
				
				//round top left wall
				color("SteelBlue") translate([0,-17,-8]) rotate([0,90,0])  cylinder(h =x-2*wall_thickness, r=4, center = true, $fs=0.1);
			}
		}
		if(display_mode == "visualization")
		{
			//color("silver") translate([0,-9,0])rotate([ 0,90,0])  cylinder(h = 7.1, r=(22/2)+0.2, center = true, $fs=0.1);
			color("silver") translate([-3.5,-9,0]) rotate([ 0,90,0]) bearing(model=608);
			color("silver") translate([0,-9,0]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness-2, r=(8/2)+0.2, center = true, $fs=0.1);
		}
	}
}

module extruder_fan_mount(x, y, wall_thickness, extruder_base_thickness)
{
	difference()
	{
		translate([0,-y/2 + wall_thickness/2, -motor_size/2]) cube([1+x-2*extruder_base_thickness, wall_thickness,motor_size],center=true);
		union()
		{
			// nuts
			translate([-3,-y/2 + wall_thickness +0.1, -motor_size/2-32.5/2]) rotate([90,90,0]) nutHole(M3, tolerance=0.1);
			translate([-3,-y/2 + wall_thickness +0.1 - wall_thickness, -motor_size/2-32.5/2]) rotate([90,90,0]) cylinder(h = wall_thickness, r=1.5, center = true, $fs=0.1);
			translate([-3,-y/2 + wall_thickness +0.1, -motor_size/2+32.5/2]) rotate([90,90,0]) nutHole(M3,tolerance=0.1);
			translate([-3,-y/2 + wall_thickness +0.1 - wall_thickness, -motor_size/2+32.5/2]) rotate([90,90,0]) cylinder(h = wall_thickness, r=1.5, center = true, $fs=0.1);
			// cut cpace between holes
			translate([0,-y/2 + wall_thickness/2, -motor_size/2]) cube([1+x-2*extruder_base_thickness+0.1, wall_thickness+0.1,22],center=true);
		}
	}
}	

module extruder_bearing_mount_nema23(x, y, wall_thickness)
{
	translate([0-0.2, 6+(motor_holes_distance/2),-(motor_holes_distance-11.5)])
	{
	
		difference()
		{
			color("SteelBlue") translate([0,0,3]) cube([x-2*wall_thickness-0.4,motor_holes_distance ,motor_holes_distance],center=true); 
			//ball bearing
			union()
			{
				translate([0,-8,7.5 ])hull() 
				{	
					translate([0,-15,0])rotate([ 0,90,0])  cylinder(h = 7.25, r=(22/2)+0.5, center = true, $fs=0.1);
					translate([0,-7.5,0])rotate([ 0,90,0])  cylinder(h = 7.25, r=(22/2)+0.5, center = true, $fs=0.1);
				}
				translate([0,0,7.5 ])hull() 
				{   
               echo("Ball bearing rod length:", (x-2*wall_thickness - 3));
					translate([0,-18,0]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness - 2.5, r=(8/2)+0.2, center = true, $fs=0.1);
					translate([0,-35,0]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness - 2.5, r=(8/2)+0.2, center = true, $fs=0.1);
				}
				//motor_screw_size mount hole
				translate([0,-11.5,-16.5 ]) rotate([0,90,0])  cylinder(h =x-2*wall_thickness, r=motor_screw_size/2+0.1, center = true, $fs=0.1);
				
				//M4 spring hole
				color("SteelBlue") hull()
				{
				translate([0,8,3 ]) rotate([45,0,0])  cylinder(h =30, r=2.2, center = true, $fs=0.1);
				translate([0,18,10 ]) rotate([45,0,0])  cylinder(h =30, r=2.2, center = true, $fs=0.1);
				
				}
				
				//cut top right corner
				color("SteelBlue") rotate([45,0,0]) translate([0,-1,-24]) cube([x-2*wall_thickness,40,30],center=true);

				//cut bottom right corner
				color("SteelBlue") rotate([135,0,0]) translate([0,-8,-32]) cube([x-2*wall_thickness,80,30],center=true);

				//cut middle right corner
				color("SteelBlue") rotate([135,0,0]) translate([0,15,-17]) cube([x-2*wall_thickness,25,25],center=true);
				//cut bottom center corner
				color("SteelBlue") rotate([0,0,0]) translate([0,-10,28]) cube([x-2*wall_thickness,25,25],center=true);
				//cut bottom left corner
				color("SteelBlue") rotate([135,0,0]) translate([0,32,0]) cube([x-2*wall_thickness,16,60],center=true);

				//cut top left corner
				color("SteelBlue") translate([0,-18,-22.5]) rotate([135,0,0])  cube([x-2*wall_thickness,60,10],center=true);
				
				//round top left wall
				//color("SteelBlue") translate([0,-17,-8]) rotate([0,90,0])  cylinder(h =x-2*wall_thickness, r=4, center = true, $fs=0.1);
			}
		}
		if(display_mode == "visualization")
		{
			//color("silver") translate([0,-9,0])rotate([ 0,90,0])  cylinder(h = 7.1, r=(22/2)+0.2, center = true, $fs=0.1);
			color("silver") translate([-3.5,-18,7.5]) rotate([ 0,90,0]) bearing(model=608);
			color("silver") translate([0,-18,7.5]) rotate([ 0,90,0]) cylinder(h = x-2*wall_thickness-2, r=(8/2)+0.2, center = true, $fs=0.1);
		}
	}
}