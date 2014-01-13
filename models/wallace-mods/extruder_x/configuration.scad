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

//////////////////////////////////
//Configuration
//////////////////////////////////

// Display mode - select "visualization" in order to display extruder with all addons or "print" to have version ready to be printed
display_mode="print"; 

// Motor selection, coment / uncoment Start/End blocks depends on motor you have

//Start nema17
	filament_diameter=1.75;
	extruder_motor_type=Nema17;
	motor_screw_size=M3;
	extruder_base_length=70;
	motor_size = 42;
	motor_shaft_diameter = 5;
	motor_holes_diameter = 3.5;
	motor_holes_distance = 31;
	motor_center_circle = 22.4;
//End nema17

/*
//Start nema23
	filament_diameter=3
	extruder_motor_type=Nema23;
	motor_screw_size=M4;
	extruder_base_length=80;
	motor_size=56.4;
	motor_shaft_diameter = 6.35;
	motor_holes_diameter = 4.5;
	motor_holes_distance = 47.1;
	motor_center_circle = 38.4;
//End nema23
*/

////////////////////////////////////////////////////////////
//extruder parameters , probbably you dont have to change it
extruder_gear_outer_diameter=8;
extruder_gear_shift=0.25;
extruder_motor_shaft_diameter=5;
extruder_motor_shaft_length=20;
extruder_motor_body_length=49;
extruder_base_thickness=6;
extruder_fan_mount_thickness=4;
extruder_base_width=25;
extruder_base_mount_hole_diameter = 4; // M4

