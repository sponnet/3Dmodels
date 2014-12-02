difference(){
 union(){
  translate([100-2,-32,0]) scale([0.5,0.5,1]) rotate([0,0,90])   linear_extrude(height = 2) import (file = "vleugel-2.dxf");
 doblo   (0,   0,   0,   4,   2,    1,  true, false );


translate([45,120,0]) rotate([0,0,-40]) doblo   (0,   0,   0,   4,   2,    1,  true, false );

 }
for (z = [0: 10]) // two iterations, z = -1, z = 1
{

//translate([20,20+z*(10-3),-1]) #cylinder(r=5 + (z*0.6) ,h=9);
}



} 

/* Thesis board, Lego and duplo compatible
Daniel.schneider@tecfa.unige.ch
oct. 2012

History:
- Version 1.0: first version
- Version 1.1: 2nd board version a bit bigger
- Version 1.2: first towers !
- Version 1.3: more towers and bricks

Instructions:
- print calibration first. If the piece doesn't fit, then act, i.e. cope with it or adjust the doblo-factory-x-y parameters
- print a chosen module by uncommenting (see below)

*/

// Define scale - must define before doblo-factory is loaded
// 0.5 = Lego and 1 = Duplo compatible

// SCALE=1;   // DUPLO Size (not fully tested)
SCALE =0.5;   // Lego size
// SCALE=0.25; // Half lego size (1/8 volume)

// setting LEGO_DIV to true will make Lego models higher, i.e. height units will be use "Lego heights" 3.2mm instead of the 2.4mm/4.8mm Duplo proportions. This param will not affect DUPLOs (scale > 0.6)

LEGO_DIV = true;     // height units = 3.2mm, use for true Lego height divisions
// LEGO_DIV = false; // height units = 2.4mm. 

// LOAD doblo factory

include <doblo-factory-1-12.scad>;

// ----------------  Execute models. Uncomment only one

// thesis_board_1 ();
// thesis_board_2 ();

// tower_data_1 (); // --- needs lettering with netfabb
// tower_central (); // 

// stack_tower_element () ;
// legobase_8x8 ();    

// smilie_tower ();
// 100_tower ();

// --- flat bricks for lettering. Uncomment only one

// doblo   (0,   0,   0,   2,   2,    2,  false, false ); // 2x2 for smilies
// doblo   (0,   0,   0,   4,   2,    3,  false, false ); // 4x2x3 chapters & issues
// doblo   (0,   0,   0,   4,   2,    2,  false, false ); // 4x2x2 alt. chapters & issues
// doblo   (0,   0,   0,   6,   2,    3,  false, false ); // 6x2x3 tasks
// doblo   (0,   0,   0,   6,   2,    2,  false, false ); // 6x2x2 tasks
// doblo   (0,   0,   0,   8,   2,    2,  false, false ); // 8x2x2 tasks for lego board
// doblo   (0,   0,   0,   8,   3,    2,  false, false ); // 8x3x2 board categories
// doblo   (0,   0,   0,   8,   4,    2,  false, false ); // 8x4x2 board categories
//doblo   (0,   0,   0,   4,   4,    2,  true, false ); // 4x4 alternative
// doblo   (0,   0,   0,   4,   3,    2,  false, false ); // 4x3 alternative
//    doblo   (0,   0,   0,   3,   3,    2,  false, false ); // 3x3 alternative


// -- flat bricks for tiling and lettering

// doblo   (0,   0,   0,   2,   2,    1,  false, false ); // 2//x2 for tiling
//for tiling
// doblo   (0,   0,   0,   6,   2,    1,  false, false ); // 6x2x1 labels wall board

// --- lego bricks

// doblo   (0,   0,   0,   4,   2,    3,  true, false ); // calibration brick
// doblo   (0,   0,   0,   2,   2,    3,  true, false ); // 2x2 nibbles for towers
// doblo   (0,   0,   0,   2,   1,    3,  true, false ); // 2x1 nibbles for towers


// ********************************** modules ******************************

// ----------------- special bricks

module smilie_tower () {
    block   (0,   0,   2,   2,   2,    13,  false, false ); // tower
    doblo   (0,   0,   0,   2,   2,    2,  false, false ); // 2x2 base
}

module 100_tower () {
    block   (0,   0,   2,   4,   4,    13,  false, false ); // tower
    doblo   (0,   0,   0,   4,   4,    2,  false, false ); // 4x4 base
}


// -------------------- boards --------------------------------------------
// Various boards. You only need one for this approach

// 
module thesis_board_1 () {
    base_plate  (-12,  -12,   0,  24,   24,   1 ,     false);
    // left - tasks section

    //       col,  row,  up, lines, rows
    nibbles  (-12, -8,   1,  4,   10);
    nibbles  (-6,  -8,   1,  2,   10);

    nibbles  (-12,  2,   1,  4,   10);
    nibbles  (-6,   2,   1,  2,   10);

    // separator
    //       col,  row,    up, width, rows, height, nibbles
    # block  (-3.75,  -12, 1,  0.5,   24,   1,  false);

    // middle - issues section
    nibbles  (-3, -8,   1,  3,   10);
    nibbles  (1,  -8,   1,  4,   10);

    // middle - free section
    nibbles  (-3,  4,   1,   1,   4);
    nibbles  (-1,  4,   1,   1,   4);
    nibbles  (1,  4,   1,   4,   4);

    //       col,  row,  up, width, rows, height, nibbles
    # block  (5.25,  -12,   1,  0.5,   24, 1,  false);

    // right - writing
    nibbles  (6,  -8,   1,  3,   10);
    nibbles  (10, -8,   1,  2,   10);

    nibbles  (6,  2,   1,  3,   10);
    nibbles  (10, 2,   1,  2,   10);
}

// a bit larger 
module thesis_board_2 () {
    base_plate  (-12,  -12,   0,  26,   25,   1 ,     false);
    // left - tasks section

    //       col,  row,  up, lines, rows
    nibbles  (-12, -9,   1,  6,   22);
    nibbles  (-5,  -9,   1,  2,   22);


    // separator
    //       col,  row,    up, width, rows, height, nibbles
    # block  (-2.75,  -12, 1,  0.5,   25,   1,  false);

    // middle - issues section
    nibbles  (-2, -8,   1,  4,   14);
    nibbles  (3,  -8,   1,  4,   14);

    // middle - free section
    nibbles  (-2,  7,   1,   4,   4);
    nibbles  (3,  7,   1,   4,   4);

    //       col,  row,  up, width, rows, height, nibbles
    # block  (7.25,  -12,   1,  0.5,   25, 1,  false);

    // right - writing
    nibbles  (8,  -9,   1,  4,   22);
    nibbles  (12, -9,   1,  2,   22);
}


// ************************** Tower modules *************************
// also use a 2 1/2 metaphor, i.e. are arranged horizontally


// --- Data Tower

module tower_data_1 () {
    doblo  (-4,  -4,   0,  8,   8,    2,  false);
    block   (-1, -1,  2,  2,    2,  15,   true) ;

    // slight overlap, corners cannot touch
    //       (col, row, up, width,length,height,nibbles_on_off) 
    block   (-2, -2,  2,  1.01,    1.01,  15,   true) ;
    block   (-2, 1,  2,   1.01,    1.01,  15,   true) ;
    block   (1, 1,  2,   1.01,    1.01,  15,   true) ;
    block   (1, -2,  2,   1.01,    1.01,  15,   true) ;

    nibbles  (-1,  -2,   2,  2,   1);
    nibbles  (-1,  1,   2,  2,   1);
    nibbles  (-2,  -1,   2,  1,   2);
    nibbles  (1,  -1,   2,  1,   2);

    // left - tasks section
}


// *********************** Stackable Tower **********************
// Use a 3D metaphor, i.e. are stackable.

module stack_tower_element () {
    doblo  (-4,  -4,   0,  8,   8,    2,  false);

    // 4 pillars
    //       (col, row, up, width,length,height,nibbles_on_off) 
    block   (-4, -4,  2,  2,    2,     15,   true) ;
    block   (2,  -4,  2,  2,    2,     15,   true) ;
    block   (-4,  2,  2,  1,    2,     15,   true) ;
    block   (3,   2,  2,  1,    2,     15,   true) ;

    nibbles  (-2,  -4,   2,  4,   2);
    nibbles  (-4,  -2,   2,  8,   2);
    nibbles  (-4,  0,   2,  8,   2);
    nibbles  (-3,  2,   2,  6,   2);
}

// This one should be stabilized with extra pillars I think
module tower_central () {
    doblo  (-4,  -4,   0,  8,   8,    2,  false);
    block   (-1, -1,  2,  2,    2,  15,   true) ;

    // slight overlap, corners cannot touch
    //       (col, row, up, width,length,height,nibbles_on_off) 
    block   (-2, -2,  2,  1.01,    1.01,  15,   true) ;
    block   (-2, 1,  2,   1.01,    1.01,  15,   true) ;
    block   (1, 1,  2,   1.01,    1.01,  15,   true) ;
    block   (1, -2,  2,   1.01,    1.01,  15,   true) ;

    // 2x1 for the indicators
    nibbles  (-1,  -2,   2,  2,   1);
    nibbles  (-1,  1,   2,  2,   1);
    nibbles  (-2,  -1,   2,  1,   2);
    nibbles  (1,  -1,   2,  1,   2);

    // surrounding
    nibbles  (-4,  -4,   2,  2,   8);	// left
    nibbles  (2,  -4,   2,  2,   8);	// right
    nibbles  (-2,  -4,   2,  4,   2);	// back
    nibbles  (-2,  2,   2,  4,   2);	// back
}


module legobase_8x8 ()
{
    doblo  (-4,  -4,   0,  8,   8,   2 ,  true);
}


