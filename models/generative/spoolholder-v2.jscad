function main() {
    var w = [];
    var m = [];
     
    for (var i=0;i<15;i++){    
        w.push(ringeske(8.1,0.06*(26-i)).translate([i*8*1.3,Math.sin(i*0.9*36/360*3.14)*3*5,0]));  
        m.push(ringeskemin(8.1).translate([i*8*1.3,Math.sin(i*0.9*36/360*3.14)*3*5,0]));  
    }
    // open last ring
    i=14;
    m.push(ringeskemin(10.1).translate([(i+0.5)*8*1.3,Math.sin(i*0.9*36/360*3.14)*3*5,0]));  

    var c = cube({size: [35,6,4]}).translate([-20,-3,0]).rotateZ(-90-45-25);
    return difference(union(w),union(m),c);
}

function ringeske(dia,scale){
       return cylinder({r:dia*scale,h:4})
}
function ringeskemin(dia){
       return cylinder({r:dia/2,h:4})
}
