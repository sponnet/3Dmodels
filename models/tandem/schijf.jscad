function main() {
    return difference(
        union(
            difference(
              
              cylinder({r1: 130/2,r2: 130/2-5, h: 4}),
              cylinder({r: 60/2, h: 5})
    
          )
          ,
          difference(
              
              cylinder({r: 80/2, h: 6}),
              cylinder({r: 60/2, h: 6})
    
          )
        ),
        holes()
    )
}

function holes(){
    var holes = [];
    var count=8;
    for(var i=0;i<count;i++){
        holes.push(
            cylinder({r: 4/2, h: 8}).translate([(60+10)/2,0,0]).rotateZ(360/count*i)
        );
    }
    return union(holes);
}
