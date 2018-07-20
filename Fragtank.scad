thickness=8;
width=120;
hight=234;
waterlevel=190;

baffle_hight=hight-thickness;
baffle_thickness=5;




// Aquarium outline
//left side
translate([-thickness,0,0]) color("Aqua", 0.2) cube([thickness, hight, 700]);
//back
//translate([-thickness,0, -thickness]) color("Aqua", 0.2) cube([500,hight,thickness]);
//right side
translate([484,0,0]) color("Aqua", 0.2) cube([thickness, hight, 700]);



// Baffles
// refugium baffle
translate([200, 0, 0]) underflow_baffle();

//Tunze Comline® DOC Skimmer 9001
//translate([205, waterlevel-135, 0]) skimmer_mockup();

// overflow baffle
translate([320, 0, 0]) overflow_baffle();
// bubble catch
translate([320+25, 0, 0]) underflow_baffle();

lid();


//probe holder
// FIXME Add holes
//probe_holder();

//front weir
front();


module lid(){
    translate([0,hight-baffle_thickness,0])
    color("black", 0.5) 
    difference(){
        //Lid solid
         cube([484, baffle_thickness, width]);
        
        // Skimmer cutout
        translate([200+baffle_thickness,0,0]) 
            cube([115,baffle_thickness,68]);
        //Finger hole
        translate([484/2, baffle_thickness, width - (68/2)]) 
            rotate([90,0,0]) cylinder(d=22,h=baffle_thickness*2);
        
        // probe cutout
        translate([484-110, 0, 0]) 
            cube([110, baffle_thickness, 20]);

        led_xy=60;
        // LED cutout
        translate([(200-led_xy)/2, 0, (width-led_xy)/2]) 
            cube([led_xy, baffle_thickness, led_xy]);
    }
    
/*    
    // Light block
    translate([baffle_thickness,hight-50-baffle_thickness,100]) 
        color("black") 
            cube([180,50,baffle_thickness]);
*/
}

module probe_holder(){
    length=120;
    translate([484-length, hight - baffle_thickness*2, 0])
        color("red") cube([length, baffle_thickness, 25]);
}

module skimmer_mockup(){
    color("YellowGreen", 0.1) cube([110,215,63]);
}

module front(){
    nozzle_hight=hight/2-30;
    color("grey")
    translate([0,0,width]){
        difference(){
             cube([484,hight,baffle_thickness]);
    
            translate([10,hight-32-10,0]){
                cube([140,32,baffle_thickness]);
            }
        
        
            color("red") 
                translate([100, nozzle_hight, -20 + baffle_thickness]) 
                    cylinder(h=23, d=30);
            
            color("red") 
                translate([484/2, nozzle_hight, -20 + baffle_thickness]) 
                    cylinder(h=23, d=30);
            
            color("red")
                translate([484-100, nozzle_hight, -20 + baffle_thickness]) 
                    cylinder(h=23, d=30);
        }
    }
}

module baffle(){
    color("black") 
    difference(){
        cube([baffle_thickness,baffle_hight,width]);
        translate([0,baffle_hight-5,10]) cube([baffle_thickness, 5, width-20]);
/*
        translate([0,35, width-25]) 
            rotate([0,90,0]) 
                cylinder(d=20, h=baffle_thickness);
*/
    }
        
}

module underflow_baffle(){
    difference(){
        baffle();
        translate([0,0,5]) color("black")  cube([baffle_thickness, 20, width-10]);
    }
}

module overflow_baffle(){
    difference(){
        baffle();
        translate([0,waterlevel,5]) color("black") cube([baffle_thickness, 20, width-10]);
    }
}