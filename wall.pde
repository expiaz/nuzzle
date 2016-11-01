public class Wall{
  
  public float x, y, l, r ,u ,d, h ,w, appW, appH, deplacement, gap, depla_gap;
  public color basicColor;
  static final int BASE_GAP = 100;
  static final int TAILLE = 25;
  static final int DEPLACEMENT = 1;
  static final int DEPLACEMENT_GAP = 3;
  
  public Wall(float x,float y,float w,float h, color basicColor){
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    
    this.gap = BASE_GAP;
    this.depla_gap = DEPLACEMENT_GAP;
    this.deplacement = DEPLACEMENT;
    this.appW = width;
    this.appH = height;
    
    this.l = this.x;
    this.r = this.l+this.w;
    this.u = this.y;
    this.d = this.u+this.h;
    this.basicColor = basicColor;
  }
  
  public void dessiner(){
    this.l = this.x;
    this.r = this.l+this.w;
    this.u = this.y;
    this.d = this.u+this.h;
    
    rectMode(CORNER);    
    fill(this.basicColor);
    noStroke();
    rect(this.x,this.y,this.w,this.h);
  }
  
  public void move(boolean onX, boolean onY){
    if(onX)
      this.x = this.x + this.deplacement;
    else if(onY)
      this.y = this.y + this.deplacement;
  }
  
  public void gap(boolean onW, boolean onH, boolean invert){
    if(onW){
      if(invert){
        this.x = this.x + this.depla_gap;
        this.w = this.w - this.depla_gap;
      }
      else{
        this.w = this.w + this.depla_gap;
      }
    }
    else if(onH){
      if(invert){
        this.y = this.y + this.depla_gap;
        this.h = this.h - this.depla_gap;
      }
      else{
        this.h = this.h + this.depla_gap;
      }
    }
  }
  
}