import controlP5.*;
ControlP5 cp5;

import themidibus.*;
MidiBus myBus; // The MidiBus

PVector center;

color cirClr = color(140,20,0);
color sqrClr = color(140,20,0);
color triClr = color(140,20,0);
color bgClr = color(230,220,200);

PImage dog, dogBark;

float countr = 0;

float circleRad = 200;
float circleRad2 = 200;

ArrayList snareArray, kickArray, hatArray;

int soundSelect = 0;

void setup(){
  size(600,600);
  dog = loadImage("sdog.png");
  dogBark = loadImage("sdogbark.png");
  
  center = new PVector(width/2, height/2);
  
  snareArray = new ArrayList();
  kickArray = new ArrayList();
  hatArray = new ArrayList();
  
  
   cp5 = new ControlP5(this);
  cp5.addSlider("circleRad")
    .setPosition(10, 20)
      .setRange(0,400)
        ;
  cp5.addSlider("circleRad2")
    .setPosition(10, 30)
      .setRange(0, 180)
        ;
        
        cp5.hide();
        
   MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
    myBus = new MidiBus(this, 0, 2); // Create a new MidiBus object
}

void draw(){
  smooth();
  
  background(bgClr);
  PVector rotrPos = getCirclePos(center, countr, circleRad);
  
  noFill();
  stroke(120,160,180);
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
  
  for (int i = hatArray.size() - 1; i>= 0; i--) {
    hiStep dStep = (hiStep) hatArray.get(i);
    dStep.update();
    dStep.distTest(rotrPos);
  }  
    
}

void mousePressed() {
   
  addNewStep(soundSelect, new PVector(mouseX, mouseY));
    
}


void keyPressed() {
  
      switch(key) {
      case '1':
        soundSelect = 0;
        break;
      case '2': 
        soundSelect = 1;
        break;
       case '3': 
        soundSelect = 2;
       break;
       case 'a':
       snareArray.clear();
       break;
       case 's':
       kickArray.clear();
       break;
       case 'd':
       hatArray.clear();
       break;
       case 'z':
       kickCircle(soundSelect);
       break;
    }
}

void kickCircle(int sndSlct){
   for(int i=0; i < 360; i+= circleRad2){
      PVector dotPoint = getCirclePos(center, i, circleRad);
      addNewStep(sndSlct, dotPoint);
   } 
}


void addNewStep(int sndSlct, PVector stepPos){
  
  switch(sndSlct) {
      case 0:
        snareArray.add(new snareStep(stepPos.x, stepPos.y));
        break;
      case 1: 
        kickArray.add(new kickStep(stepPos.x, stepPos.y));
        break;
       case 2: 
        hatArray.add(new hiStep(stepPos.x, stepPos.y));
       break;
    }
}