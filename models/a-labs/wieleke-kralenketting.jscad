function main() {

    return difference(
        union(
        cylinder({r:27/2,h:8}),
        cylinder({r:7,h:15})


            ),
        cube({size:[3,5,240],center:true}),
        cube({size:[4.7,4.5,240],center:true}).translate([0,27/2,0]),
        cylinder({r:3/2,h:150}).rotateY(90).translate([0,0,11.5]),

        cube({size:[2.3,5.3,20]}).translate([2.3,-5.3/2,8])

        );

}
