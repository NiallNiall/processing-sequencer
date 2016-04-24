class stepController {
  
  ArrayList stepArray;
  String stepType;
 
  stepController(String sType){
    
    stepType = sType;
    stepArray = new ArrayList();
    
  }
  
  void update(PVector rotrPos){

    for (int i = stepArray.size() - 1; i>= 0; i--) {
      snareStep dStep = (snareStep) stepArray.get(i);
      dStep.update();
      dStep.distTest(rotrPos);
    }  
    
  }
  
}