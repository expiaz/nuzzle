public class Point{

  int x, y, w, h, l, r, u, d, appW, appH, givenPoints;
  color colorP;
  boolean bonus;
  float creation_time, remaining_time, prc, lifetime, min_lifetime, timebar_length;
  //boolean timer_loop = true;
  
  Point(int time, int lifetime, int w, int h, color basicColor){
    this.givenPoints = 1;
    this.colorP = basicColor;
    this.bonus = false;
    this.appW = width;
    this.appH = height;
    this.w=w;
    this.h=h;
    this.x = floor(random(5,this.appW-15));
    this.y = floor(random(5,this.appH-15));
    this.lifetime = lifetime;
    this.creation_time = time;
    //this.min_lifetime = lifetime/3;
  }
  
  
  public void dessiner(int time){
    this.w=10;
    this.h=10;
    this.l = this.x;
    this.r = this.l+this.w;
    this.u = this.y;
    this.d = this.u+this.h;
    fill(colorP);
    rectMode(CORNER);
    noStroke();
    rect(this.x,this.y,this.w,this.h);
    this.drawTimebar(time);
  }
  
  private void drawTimebar(int time){
    this.remaining_time = time - this.creation_time;
    this.prc = (this.remaining_time/this.lifetime);
    
    //timebar length
    this.timebar_length = floor(40-40*this.prc);
    
    //background timebar
    rectMode(CORNER);
    fill(0,0,0);
    noStroke();
    
    
    rectMode(CORNER);
    noStroke();

    if(this.y > this.appH/2){
      //timebar background
      fill(255);
      rect(this.x-15,this.y-20,40,5); 
      //real timebar
      fill(colorP);
      rect(this.x-15,this.y-20,this.timebar_length,5); 
    }else{
      //timebar background
      fill(255);
      rect(this.x-15,this.y+20,40,5); 
      //real timebar
      fill(colorP);
      rect(this.x-15,this.y+20,this.timebar_length,5); 
    }
    
  }
  
  public boolean OOT(){
    if(this.prc >= 1){
      return true;
    }
    return false;
  }
  
}