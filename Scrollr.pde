class Trigger {

  boolean trigAvail;
  
  int trigAmount = 1;
  int channel = 1;
  int pitch = 64;
  int velocity = 127;

  Trigger() {
    trigAvail = true;
  }

  void update() {
  }


  void trigger() {

    if (trigAvail) {
      //println("Entered " + trigAmount);
      trigAmount +=1;
      trigOff();
      sendTrigger();
    }
  }

 void sendTrigger(){

    Note note = new Note(channel, pitch, velocity);
  
    myBus.sendNoteOn(note); 
 }

  void trigOff() {
    trigAvail = false;
  }

  void trigOn() {
    trigAvail = true;
  }
  
  void setChannel(int chan){
    channel = chan;
  }
  void setPitch(int pit){
    pitch = pit;
  }
  void setVelocity(int vel){
    velocity = vel;
  }
  
}