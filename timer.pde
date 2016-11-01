public class Timer {
  int init_time = 0;
  int starttime = 0;
  int stoptime = 0;
  int retard = 0;
  boolean run; 
  
  public void start(){
    this.init_time = millis();
    this.run = false;
  }
  
  public void play(){
    if(!this.run){
      this.retard += millis() - this.stoptime;
      this.run = true;
    }
  }
  
  public void pause(){
    if(this.run){
      this.run=false;
      this.stoptime = millis();
    }
  }
  
  public int getTime(){
    if(this.run)
      return millis() - this.retard;
    else
      return this.stoptime;
  }
  
}