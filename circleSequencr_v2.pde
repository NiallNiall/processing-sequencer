import controlP5.*;
ControlP5 cp5;

import themidibus.*;
MidiBus myBus; // The MidiBus

PVector center;

float countr = 0;

float circleRad = 200;
float circleRad2 = 200;

ArrayList snareArray, kickArray;

int soundSelect = 0;

void setup(){
  size(600,600);
  
  center = new PVector(width/2, height/2);
  
  snareArray = new ArrayList();
  kickArray = new ArrayList();
  
  
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
    
  for (int i = snareArray.size() - 1; i>= 0; i--) {
    snareStep dStep = (snareStep) snareArray.get(i);
    dStep.update();
    dStep.distTest(rotrPos);
  }  
  
    for (int i = kickArray.size() - 1; i>= 0; i--) {
    kickStep dStep = (kickStep) kickArray.get(i);
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
   
    switch(soundSelect) {
      case 0:
        snareArray.add(new snareStep(mouseX, mouseY));
        break;
      case 1: 
        kickArray.add(new kickStep(mouseX, mouseY));
        break;
    }
}


void keyPressed() {
  
      switch(key) {
      case '1':
        soundSelect = 0;
        break;
      case '2': 
        soundSelect = 1;
        break;
    }
}