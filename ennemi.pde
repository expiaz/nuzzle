public class Ennemi{
  
  int w,h,l,r,u,d,v,appW,appH,pos;
  float x,y,x_base,y_base;
  color basicColor;
  
  Ennemi(color basicColor){
    this.basicColor = basicColor;
    this.appW=width;
    this.appH=height;
    this.w=7;
    this.h=7;
    
    this.pos = floor(random(1,5));
    switch(this.pos){
     case(1):
       this.x = floor(random(10,appW-10));
       this.y = 10;
       this.x_base = this.x;
       this.y_base = this.y;
       break;
     case(2):
       this.x = width-10;
       this.y = floor(random(10,appH-10));
       this.x_base = this.x;
       this.y_base = this.y;
       break;
     case(3):
       x = floor(random(10,appW-10));
       y = height-10;
       this.x_base = this.x;
       this.y_base = this.y;
       break;
     case(4):
       this.x = 10;
       this.y = floor(random(10,appH-10));
       this.x_base = this.x;
       this.y_base = this.y;
       break;
    }

  }
  
  public void move(int vel){
    if(this.x_base<this.appW/2 && (this.pos==1 || this.pos==3)){
      this.x += vel;
      if(this.pos==1){
        this.y += vel;
      } else if(this.pos==3){
        this.y -= vel;
      } 
    } else if(this.x_base>=this.appW/2 && (this.pos==1 || this.pos==3)){
      this.x -= vel;
      if(this.pos==1){
        this.y += vel;
      } else if(this.pos==3){
        this.y -= vel;
      } 
    }
    else if(this.y_base<this.appH/2 && (this.pos==2 || this.pos==4)){
      this.y += vel;
      if(this.pos==2){
        this.x -= vel;
      } else if(this.pos==4){
        this.x += vel;
      }
    } 
    else if(this.y_base>=this.appH/2 && (this.pos==2 || this.pos==4)){
      this.y -= vel;
      if(this.pos==2){
        this.x -= vel;
      } else if(this.pos==4){
        this.x += vel;
      }
    }
    
  }
  
  public void dessiner(){
    this.l = floor(x);
    this.r = l+w;
    this.u = floor(y);
    this.d = u+h;
    fill(this.basicColor);
    noStroke();
    rect(this.x,this.y,this.w,this.h);
  }
  
  public boolean OOB(){
    if(this.l>0 && this.r<this.appW && this.u>0 && this.d<this.appH){
      return false;
    }
    return true;
  }
  
}