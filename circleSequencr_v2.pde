import controlP5.*;
ControlP5 cp5;

import themidibus.*;
MidiBus myBus; // The MidiBus

PVector center;

float countr = 0;

float circleRad = 200;
float circleRad2 = 200;

//drumStep[] dsArray = new drumStep[10];
ArrayList dsArray;

drumStep ds1, ds2;

void setup(){
  size(600,600);
  
  center = new PVector(width/2, height/2);
  
  dsArray = new ArrayList();
  
  
   cp5 = new ControlP5(this);
  cp5.addSlider("circleRad")
    .setPosition(10, 20)
      .setRange(0,400)
        ;
  cp5.addSlider("circleRad2")
    .setPosition(10, 30)
      .setRange(0.005, 0.1)
        ;
        
   MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
    myBus = new MidiBus(this, 0, 2); // Create a new MidiBus object
}

void draw(){
  smooth();
  
  background(3,12,18);
  PVector rotrPos = getCirclePos(center, countr, circleRad);
  
  noFill();
  stroke(180,200,215);
  strokeWeight(6);
  ellipse(center.x, center.y, circleRad*2 , circleRad*2);
   
  noStroke();
  fill(250);
  ellipse(rotrPos.x, rotrPos.y, 20 , 20);
  
  if(countr < 360){
    countr += 3.0;    
  } else {
    countr = 0;
  }

  //ds1.distTest(rotrPos);
  //ds1.update();
    
  for (int i = dsArray.size() - 1; i>= 0; i--) {
    drumStep dStep = (drumStep) dsArray.get(i);
    dStep.update();
    dStep.distTest(rotrPos);
  }  
    
    
}



 void trigOff() {
    //trigAvail = false;
  }
  
  void trigOn() {
    //trigAvail = true;
  }
  
 void mousePressed() {
    dsArray.add(new drumStep(mouseX, mouseY));
}