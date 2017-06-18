// M Prime One Wide
// Definition of holes, coordinates from the origin (left-bottom of the frame)

module frame() {
holes=[[25,5],[57,5],[113,5],[145,5],  // bottom row 
            [27,50],[53.5,50],[116.5,50],[143,50], [53.5,30],[116.5,30], // Z support            
            [25,355],[57,355],[113,355],[145,355],  // Top row
            [12,210],[12,230]];   // lateral
difference() {
// frame base
 difference ()  {
    cube([210,436,10]);
    union () {
        translate([0,436-21,-1]) rotate ([0,0,45]) cube([30,30,12]);                    // upper corners
        translate([210,436-21,-1]) rotate ([0,0,45]) cube([30,30,12]);   
    }   
}     
// holes
    union () {
        // Z hole
        translate ([50,55,-1]) cube([70,260,12]);
        // Handle hole
        translate ([31,436-50,-1]) cube([108,30,12]);
        // Cable passthrough
        translate ([97,12.5,-1]) cube([10,22,12]);
        // screw holes
        for (i=[0:len(holes)]) {
            translate([holes[i][0],holes[i][1],-1]) cylinder(h=12,r=1.5);
        }
        
    }
}
}
projection () frame();