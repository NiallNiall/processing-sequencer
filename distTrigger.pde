class drumStep {

  Trigger drumTrig;
  
  PVector stepPos;

  drumStep() {
    float stepPosX = 100;
    float stepPosY = 100;
    
    stepPos = new PVector(stepPosX, stepPosY);
    
    drumTrig = new Trigger();
    
    drumTrig.setPitch(int(random(60,80)));
  }
  
  void update() {
    drawStep();
  }
  
  void drawStep(){
    
  }
  
  void setChannel(int chan){
   drumTrig.setChannel(chan); 
  }
  
  void setPitch(int pit){
   drumTrig.setPitch(pit); 
  }
  
  void distTest(PVector testerPos) {
    PVector distGap = PVector.sub(stepPos, testerPos);
    float distMag = distGap.mag();
    //println(distMag);
    
    if(distMag < 50){
      drumTrig.trigger();
    } else {
       drumTrig.trigOn(); 
    }
    
  }
  
}



class snareStep extends drumStep {
  
  snareStep(float stepPosX, float stepPosY){
    stepPos = new PVector(stepPosX, stepPosY);    
  }
   void drawStep(){
     fill(250,0,0);
     ellipse(stepPos.x, stepPos.y, 20,20);
   }
}

class kickStep extends drumStep {
  
  kickStep(float stepPosX, float stepPosY){
    stepPos = new PVector(stepPosX, stepPosY);
    setChannel(2);
    setPitch(40);
  }
   void drawStep(){
     fill(250,250,0);
     rectMode(CENTER);
     rect(stepPos.x, stepPos.y, 20,20);
   }
}