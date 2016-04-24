class drumStep {

  Trigger drumTrig;
  
  PVector stepPos;

  drumStep(float stepPosX, float stepPosY) {
    stepPos = new PVector(stepPosX, stepPosY);
    
    drumTrig = new Trigger();
    
    drumTrig.setPitch(int(random(60,80)));
  }
  
  void update() {
    fill(250,0,0);
    ellipse(stepPos.x, stepPos.y, 20,20);
    //drawShape();
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
  
  //void drawStep();
  
}






//class snareStep s drumStep {
  
//  void drawStep(){
//   ellipse(stepPos.x, stepPos.y, 20,20);
//  }
  
//}