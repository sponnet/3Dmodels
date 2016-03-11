// title      : OpenJSCAD.org Logo
// author     : Rene K. Mueller
// license    : MIT License
// revision   : 0.003
// tags       : Logo,Intersection,Sphere,Cube
// file       : logo.jscad

function main(){
    var objects = [];
    for (var i=0;i<3;i++){
        var h = bearing_holder().translate([23.6,0,0]).rotateZ((360/3)*i);        
        objects.push(h);
    }
    objects.push(magnet_holder());
    return objects;

}

function bearing_holder() {
    var bearing_diameter = 13;
    var bearing_height = 7;
    var shellwidth = 2;
   return difference(
    cylinder({r:bearing_diameter/2+shellwidth,h:bearing_height}),
    cylinder({r:bearing_diameter/2,h:bearing_height}),
    cube([80,2,bearing_height+10]).translate([0,-2/2,0])
    );
}

function magnet_holder() {
    // size of the magnet
    var diameter = 15+0.1;
    var height = 3;
    var shellwidth = 2;
    var distance_from_plane = 0;
   return difference(
    cylinder({r:diameter+shellwidth,h:height+shellwidth}),
    cylinder({r:diameter,h:height}).translate([0,0,shellwidth])
    ).translate([0,0,distance_from_plane-distance_from_plane])
}
