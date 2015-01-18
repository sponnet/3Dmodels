
function main() {
	return plus();
}


function plus(){
	var radius = 50; 
	var w = new Array();
    var s=30;
   	var floors=9;
    for(var j=0;j<floors;j++){
    	var rotation_offset_y = j*795.4;
    	var rotation_offset_z = (j+45)*16.4;
		switch(j % 2) {
    		case 0:
		    	for(var i=0;i<s;i++){
		    	    w.push(
			         	translate([0,0,Math.sin((Math.PI/2/floors)*j)*radius],
			         		rotate([0,0,360/s*i],rotate([90/s*i,rotation_offset_y,rotation_offset_z],cube({size: (radius/4)-((radius/4)/floors/1.2)*j, center: true}))
			         		.translate([Math.cos((Math.PI/2/floors)*j)*radius,0,0]))
			         	)
						.subtract(
							cube(3*radius).translate([-1.5*radius,-1.5*radius,-3*radius])
			         	)
			      	);
			    }
				break;
			case 1:
				for(var i=0;i<s;i++){
		    	    w.push(
			         	translate([0,0,Math.sin((Math.PI/2/floors)*j)*radius],
			         		rotate([0,0,360/s*i],rotate([180/s*i,rotation_offset_y,rotation_offset_z],cylinder({r: radius/8, h: 10, center: true}))
			         		.translate([Math.cos((Math.PI/2/floors)*j)*radius,0,0]))
			         	)
						.subtract(
							cube(3*radius).translate([-1.5*radius,-1.5*radius,-3*radius])
			         	)
			      	);
			    }			
			break;  
		}
	}

	w.push(sphere(radius).subtract(
		cube(3*radius).translate([-1.5*radius,-1.5*radius,-3*radius])).subtract(
	    cylinder({r:2.5,h:10})));
	
    return w;    
}
