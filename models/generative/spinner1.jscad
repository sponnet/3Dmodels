
function main() {
	return plus();
}


function plus(){
	var w = new Array();
    var s=30;
   	var floors=10;
    for(var j=0;j<floors;j++){
    	var rotation_offset_y = j*785.4;
    	var rotation_offset_z = (j+45)*15.4;

    	for(var i=0;i<s;i++){
	         w.push(
	         	translate([0,0,Math.sin((Math.PI/2/floors)*j)*10],
	         		rotate([0,0,360/s*i],rotate([90/s*i,rotation_offset_y,rotation_offset_z],cube({size: 3-(3/floors/1.2)*j, center: true}))
	         		.translate([Math.cos((Math.PI/2/floors)*j)*10,0,0]))
	         	)
				.subtract(
					cube(30).translate([-15,-15,-30])
	         	)

	      	);
	    }
	}

	w.push(sphere(10).subtract(
		cube(30).translate([-15,-15,-30])
	         ));
	
    return w;    
}
