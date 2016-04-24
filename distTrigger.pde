class drumStep {

  Trigger drumTrig;
  
  PVector stepPos;
  float Radius = 20;

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
      Radius = 30;
    } else {
       drumTrig.trigOn();
       Radius = 20;
    }
    
  }
  
}



class snareStep extends drumStep {
  
  snareStep(float stepPosX, float stepPosY){
    stepPos = new PVector(stepPosX, stepPosY);
    setPitch(60);
  }
   void drawStep(){
     fill(cirClr);
     //ellipse(stepPos.x, stepPos.y, Radius, Radius);
     imageMode(CENTER);
     if(Radius <= 20){
       image(dog, stepPos.x, stepPos.y);
     } else {
       image(dogBark, stepPos.x, stepPos.y);     
     }
   }
}

class kickStep extends drumStep {
  
  kickStep(float stepPosX, float stepPosY){
    stepPos = new PVector(stepPosX, stepPosY);
    setChannel(2);
    setPitch(40);
  }
   void drawStep(){
     fill(sqrClr);
     rectMode(CENTER);
     rect(stepPos.x, stepPos.y, Radius, Radius);
   }
}

class hiStep extends drumStep {
  
  hiStep(float stepPosX, float stepPosY){
    stepPos = new PVector(stepPosX, stepPosY);
    setChannel(3);
    setPitch(50);
  }
   void drawStep(){
     fill(triClr);
     rectMode(CENTER);
     float triRad = Radius /2;
     triangle(stepPos.x, stepPos.y-triRad, stepPos.x+triRad, stepPos.y+triRad, stepPos.x-triRad, stepPos.y+triRad);
   }
}