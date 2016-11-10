public class Ennemi{
  
  public int w,h,l,r,u,d,v,appW,appH,pos;
  public float x,y,x_base,y_base;
  public color basicColor;
  
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

public class Player {

  public int w, h, x, y, appW, appH, r, l, d, u, upgrade_velocity_counter;
  public int velocity;
  public color basicColor;
  public boolean upPressed, downPressed, leftPressed, rightPressed;


  public Player(color basicColor) {
    this.w = 15;
    this.h = 15;
    this.appW = width;
    this.appH = height;
    this.x = this.appW/2;
    this.y = this.appH/2;

    this.l = this.x-this.w/2;
    this.r = this.x + this.w/2;
    this.u = this.y - this.h/2;
    this.d = this.y +this.h/2;

    this.basicColor = basicColor;
    this.upPressed = false;
    this.downPressed = false;
    this.leftPressed = false;
    this.rightPressed = false;
    this.velocity = 3;
  }

  public void dessiner() {
    this.x = mouseX;
    this.y = mouseY;
    this.l = this.x-this.w/2;
    this.r = this.x + this.w/2;
    this.u = this.y - this.h/2;
    this.d = this.y + this.h/2;
    fill(basicColor);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h);
  }

  public void move() {
    if (this.upPressed) {
      this.y -= this.velocity;
    }
    if (this.downPressed) {
      this.y += this.velocity;
    }
    if (this.leftPressed) {
      this.x -= velocity;
    }
    if (this.rightPressed) {
      this.x += this.velocity;
    }

    this.l = this.x-this.w/2;
    this.r = this.x + this.w/2;
    this.u = this.y - this.h/2;
    this.d = this.y + this.h/2;

    fill(this.basicColor);
    rectMode(CENTER);
    noStroke();
    rect(this.x, this.y, this.w, this.h);
  }

  public void lenght(int lenght) {
    this.w += lenght;
    this.h += lenght;
  }

  public void velocity(int vel) {
    this.upgrade_velocity_counter++;
    if(this.upgrade_velocity_counter == 3){
      this.velocity += vel;
      this.upgrade_velocity_counter = 0;
    }
  }

  public boolean OOB() {
    if (this.l>0 && this.r<this.appW && this.u>0 && this.d<this.appH) {
      return false;
    }
    return true;
  }


  public int getX() {
    return this.x;
  }

  public int getY() {
    return this.y;
  }

  public void setX(int x) {
    this.x = x;
  }

  public void setY(int y) {
    this.y = y;
  }
}

public class Point{

  public int x, y, w, h, l, r, u, d, appW, appH, givenPoints;
  public color colorP;
  public boolean bonus;
  public float creation_time, remaining_time, prc, lifetime, min_lifetime, timebar_length;
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

public class PointBonus extends Point{
  
  public String bonusType;
  
PointBonus(int time, int lifetime, int bonusType, color basicColor){
    super(time,10000,10,10,basicColor);
    this.bonus = true;
    switch(bonusType){
      case 1:
        this.bonusType = "RESET";
        this.colorP = color(0,0,0);
        this.lifetime = lifetime / 3;
        this.w = 5;
        this.h = 5;
        this.givenPoints = 2;
        break;
      case 2:
        this.bonusType = "TELEPORT";
        this.colorP = color(125,0,200);
        this.lifetime = lifetime / 4;
        this.w = 15;
        this.h = 15;
        this.givenPoints = 3;
        break;
      case 3:
        this.bonusType = "INVINCIBLE";
        this.colorP = color(125,50,255);
        this.lifetime = lifetime / 2;
        this.w = 5;
        this.h = 5;
        this.givenPoints = 2;
        break;
    }
    
  }
  

  
}

public class Timer {
  public int init_time = 0;
  public int starttime = 0;
public int stoptime = 0;
  public int retard = 0;
  public boolean run; 
  
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
  
  public void gap_move(boolean onW, boolean onH, boolean invert){
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

public class WallManager{
  public ArrayList<Wall> WT;
  public ArrayList<Wall> WB;
  public ArrayList<Wall> WR;
  public ArrayList<Wall> WL;
  public int i, appW, appH;
 
  WallManager(int T, int R, int B, int L, int ecart, color basicColor){
    this.WT = new ArrayList<Wall>();
    this.WB = new ArrayList<Wall>();
    this.WR = new ArrayList<Wall>();
    this.WL = new ArrayList<Wall>();
    
    this.appW = width;
    this.appH = height;
    
    for(this.i = 0; this.i < T; this.i++){
      // murs du haut
      Wall wl = new Wall(B_WT_X,B_WT_Y,B_WT_W,B_WT_H, basicColor);
      if(this.i > 0 && ecart > 0){
        wl.x -= ecart*this.i;
      }
      this.add(wl,1);
    }
    for(this.i = 0; this.i < R; this.i++){
      // murs du right
      Wall wl = new Wall(B_WR_X,B_WR_Y,B_WR_W,B_WR_H, basicColor);
      if(this.i > 0 && ecart > 0){
        wl.y -= ecart*this.i;
      }
      this.add(wl,2);
    }
    for(this.i = 0; this.i < B; this.i++){
      // murs du bas
      Wall wl = new Wall(B_WB_X,B_WB_Y,B_WB_W,B_WB_H, basicColor);
      if(this.i > 0 && ecart > 0){
        wl.x -= ecart*this.i;
      }
      this.add(wl,3);
    }
    for(this.i = 0; this.i < L; this.i++){
      //murs left
      Wall wl = new Wall(B_WL_X,B_WL_Y,B_WL_W,B_WL_H, basicColor);
      if(this.i > 0 && ecart > 0){
        wl.y -= ecart*this.i;
      }
      this.add(wl,4);
    }
  }
  
  public void add(Wall wall, int position){
    switch(position){
      case(1):
        WT.add(wall);
        break;
      case(2):
        WR.add(wall);
        break;
      case(3):
        WB.add(wall);
        break;
      case(4):
        WL.add(wall);
        break;
      default:
        WT.add(wall);
        break;
    }
  }
  
  public void dessiner(){
    for(Wall wl : WT){
      wl.dessiner();
    }
    for(Wall wl : WB){
      wl.dessiner();
    }
    for(Wall wl : WL){
      wl.dessiner();
    }
    for(Wall wl : WR){
      wl.dessiner();
    }
  } 
  
  public boolean hitbox(Player p){
    ArrayList<Wall> Collection = new ArrayList<Wall>();
    Collection.addAll(WT);
    Collection.addAll(WR);
    Collection.addAll(WB);
    Collection.addAll(WL);
    for(Wall wl : Collection){
      if((p.r > wl.l && p.u < wl.d && p.r < wl.r && p.u > wl.u) || (p.l < wl.r && p.u < wl.d && p.l > wl.l && p.u > wl.u) || (p.r > wl.l && p.d > wl.u && p.r < wl.r && p.d < wl.d) || (p.l < wl.r && p.d > wl.u && p.l > wl.l && p.d < wl.d)){
        return true;
      }
    }
    return false;
  }
  
  
  /************************************
  *************************************
  *            DEPLACEMENT            *
  *************************************
  *************************************/
  
  public void move(boolean top, float top_s, boolean right, float right_s, boolean bottom, float bottom_s, boolean left, float left_s){
    // top_s .. var are for setting the velocity in pixels (basic 1) of the deplacement manually
    
    if(top && right && bottom && left){
      
      // all walls moves
      for(Wall wl : WT){ //top
        if(wl.x <= 0 && wl.deplacement < 0){
          wl.deplacement = abs(wl.deplacement);
          if(top_s != 0){ 
            wl.deplacement = top_s;
          }
        }
        else if(wl.x >= appW-wl.w && wl.deplacement > 0){
          wl.deplacement = - wl.deplacement;
          if(top_s != 0){ 
            wl.deplacement = - top_s;
          }
        }
        wl.move(true,false);
      }
      
      for(Wall wl : WB){ //bottom
        if(wl.x <= 0 && wl.deplacement < 0){
          wl.deplacement = abs(wl.deplacement);
          if(bottom_s != 0){ 
            wl.deplacement = bottom_s;
          }
        }
        else if(wl.x >= appW-wl.w && wl.deplacement > 0){
          wl.deplacement = - wl.deplacement;
          if(bottom_s != 0){ 
            wl.deplacement = - bottom_s;
          }
        }
        wl.move(true,false);
      }
      
      for(Wall wl : WL){ //left
        if(wl.y <= 0 && wl.deplacement < 0){
          wl.deplacement = abs(wl.deplacement);
          if(left_s != 0){ 
            wl.deplacement = left_s;
          }
        }
        else if(wl.y >= appH-wl.h && wl.deplacement > 0){
          wl.deplacement = - wl.deplacement;
          if(left_s != 0){ 
            wl.deplacement = - left_s;
          }
        }
        wl.move(false,true);
      }
      
      for(Wall wl : WR){ //right
        if(wl.y <= 0 && wl.deplacement < 0){
          wl.deplacement = abs(wl.deplacement);
          if(right_s != 0){ 
            wl.deplacement = right_s;
          }
        }
        if(wl.y >= appH-wl.h && wl.deplacement > 0){
          wl.deplacement = - wl.deplacement;
          if(right_s != 0){ 
            wl.deplacement = -right_s;
          }
        }
        wl.move(false,true);
      }
      
    }//endif
    
    else{
      
      if(top){
        for(Wall wl : WT){ //top
          if(wl.x <= 0 && wl.deplacement < 0){
            wl.deplacement = abs(wl.deplacement);
          }
          else if(wl.x >= appW-wl.w && wl.deplacement > 0){
            wl.deplacement = - wl.deplacement;
          }
          wl.move(true,false);
        }
      }
      else{
        for(Wall wl : WT){ //top
          wl.move(false,false);
        }
      }
      
      if(right){
        for(Wall wl : WR){ //right
          if(wl.y <= 0 && wl.deplacement < 0){
            wl.deplacement = abs(wl.deplacement);
          }
          if(wl.y >= appH-wl.h && wl.deplacement > 0){
            wl.deplacement = - wl.deplacement;
          }
          wl.move(false,true);
        }
      }
      else{
        for(Wall wl : WR){ //top
          wl.move(false,false);
        }
      }
      
      if(bottom){
        for(Wall wl : WB){ //bottom
          if(wl.x <= 0 && wl.deplacement < 0){
            wl.deplacement = abs(wl.deplacement);
          }
          else if(wl.x >= appW-wl.w && wl.deplacement > 0){
            wl.deplacement = - wl.deplacement;
          }
          wl.move(true,false);
        }
      }
      else{
        for(Wall wl : WB){ //top
          wl.move(false,false);
        }
      }
      
      if(left){
        for(Wall wl : WL){ //left
          if(wl.y <= 0 && wl.deplacement < 0){
            wl.deplacement = abs(wl.deplacement);
          }
          else if(wl.y >= appH-wl.h && wl.deplacement > 0){
            wl.deplacement = - wl.deplacement;
          }
          wl.move(false,true);
        }
      }
      else{
        for(Wall wl : WL){ //top
          wl.move(false,false);
        }
      }
      
    }//endelse
    
  }
  
  
  public void gapMove(boolean top, boolean right, boolean bottom, boolean left){
    
    if(top && right && bottom && left){
      
      for(Wall wl : WT){ //top
        if(wl.h <= 0 && wl.depla_gap < 0){ //haut
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.h >= appH-wl.gap && wl.depla_gap > 0){ //bas
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap_move(false,true,false);
      }
      
      for(Wall wl : WB){ //bottom
        if(wl.y <= 0 + wl.gap && wl.depla_gap < 0){ // haut
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.y >= appH && wl.depla_gap > 0){ //bas
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap_move(false,true,true);
      }
      
      for(Wall wl : WL){ //left
        if(wl.w <= 0 && wl.depla_gap < 0){ // haut
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.w >= appW-wl.gap && wl.depla_gap > 0){ //bas
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap_move(true,false,false);
      }
      
      for(Wall wl : WR){ //right
        if(wl.x <= 0+wl.gap && wl.depla_gap < 0){
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.x >= appW && wl.depla_gap > 0){
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap_move(true,false,true);
      }
      
    }//endif
    
    else{
      
      if(top){
        for(Wall wl : WT){ //top
          if(wl.h <= 0 && wl.depla_gap < 0){ //haut
            wl.depla_gap = abs(wl.depla_gap);
          }
          if(wl.h >= appH-wl.gap && wl.depla_gap > 0){ //bas
            wl.depla_gap = - wl.depla_gap;
          }
          wl.gap_move(false,true,false);
        }
      }
      else{
        for(Wall wl : WT){ //top
          wl.gap_move(false,true,false);
        }
      }//top
      
      if(right){
        for(Wall wl : WR){ //right
          if(wl.x <= 0+wl.gap && wl.depla_gap < 0){
            wl.depla_gap = abs(wl.depla_gap);
          }
          if(wl.x >= appW && wl.depla_gap > 0){
            wl.depla_gap = - wl.depla_gap;
          }
          wl.gap_move(true,false,true);
        }
      }
      else{
        for(Wall wl : WR){ //right
          wl.gap_move(false,false,false);
        }
      }//right
      
      if(bottom){
        for(Wall wl : WB){ //bottom
          if(wl.y <= 0 + wl.gap && wl.depla_gap < 0){ // haut
            wl.depla_gap = abs(wl.depla_gap);
          }
          if(wl.y >= appH && wl.depla_gap > 0){ //bas
            wl.depla_gap = - wl.depla_gap;
          }
          wl.gap_move(false,true,true);
        }
      }
      else{
        for(Wall wl : WB){ //bottom
          wl.gap_move(false,false,false);
        }
      }//bottom
      
      if(left){
        for(Wall wl : WL){ //left
          if(wl.w <= 0 && wl.depla_gap < 0){ // haut
            wl.depla_gap = abs(wl.depla_gap);
          }
          if(wl.w >= appW-wl.gap && wl.depla_gap > 0){ //bas
            wl.depla_gap = - wl.depla_gap;
          }
          wl.gap_move(true,false,false);
        }
      }
      else{
        for(Wall wl : WL){ //left
          wl.gap_move(false,false,false);
        }
      }//left
      
    }//endelse
     
  }
  
  
  
  
  
  /************************************
  *************************************
  *         DESYNCHRONISATION         *
  *************************************
  *************************************/
  
  public void gapModifier(float Vertical, float Horizontal){
    if(Horizontal != 0){
      for(Wall wl : WL){
        wl.depla_gap -= Horizontal;
      }
      for(Wall wl : WR){
        wl.depla_gap += Horizontal;
      }
    }
    if(Vertical != 0){
      for(Wall wl : WT){
        wl.depla_gap -= Vertical;
      }
      for(Wall wl : WB){
        wl.depla_gap += Vertical;
      }
    }
  }
  
  public void moveModifier(float T, float R, float B, float L){
    if(T!=0){
      for(Wall wl : WT){
        wl.deplacement = T;
      }
    }
    if(R!=0){
      for(Wall wl : WR){
        wl.deplacement = R;
      }
    }
    if(B!=0){
      for(Wall wl : WB){
        wl.deplacement = B;
      }
    }
    if(L!=0){
      for(Wall wl : WL){
        wl.deplacement = L;
      }
    }
  }
  
}

public class EnnemiManager{

  public ArrayList<Ennemi> ennemiCollection;
  public ArrayList<Ennemi> ennemiCleanCollection;
  public boolean retour;
  public color basicColor;

  EnnemiManager(color basicColor){
    this.basicColor = basicColor;
    this.last_spawned_ennemi = 0;
    this.nb_ennemi_spawned = 0;
    this.ennemiCollection = new ArrayList<Ennemi>();
    this.ennemiCleanCollection = new ArrayList<Ennemi>();
  }

  public void create(int time){
    if (time - this.last_spawned_ennemi >= 1500) {
      this.ennemiCollection.add(new Ennemi(this.basicColor));
      this.last_spawned_ennemi = time;
      this.nb_ennemi_spawned++;
    }
  }

  public void move(){
    for(Ennemi e : ennemiCollection){
      e.move(2); // = vitesse ref move() ennemi
      e.dessiner();
    }
  }

  public boolean hitbox(Player p){
    for(Ennemi e : ennemiCollection) {
      if((e.r > p.l && e.u < p.d && e.r < p.r && e.u > p.u) || (e.l < p.r && e.u < p.d && e.l > p.l && e.u > p.u) || (e.r > p.l && e.d > p.u && e.r < p.r && e.d < p.d) || (e.l < p.r && e.d > p.u && e.l > p.l && e.d < p.d)){
        ennemiCleanCollection.add(e);
        return true; //<>//
      }
      else if(e.OOB()){
        ennemiCleanCollection.add(e);
      }
    }
    clean();
    return false;
  }

  private void clean(){

    for(this.i=0; this.i<ennemiCleanCollection.size(); this.i++){
      Ennemi e = ennemiCleanCollection.get(this.i);
      ennemiCollection.remove(e);
      //ennemiCleanCollection.remove(e);
    }
  }

}

public class PointManager{
  
  private ArrayList<Point> pointCollection;
  private ArrayList<Point> pointCleanCollection;  
  
  private ArrayList<PointBonus> pointBonusCollection;
  private ArrayList<PointBonus> pointBonusCleanCollection;
  
  private int i, bonus_random, bonus_type, bonus_random_condition, lifetime;
  
  public color basicColor;
  
  PointManager(color basicColor){
    this.pointCollection = new ArrayList<Point>();
    this.pointCleanCollection = new ArrayList<Point>();
    
    this.pointBonusCollection = new ArrayList<PointBonus>();
    this.pointBonusCleanCollection = new ArrayList<PointBonus>();
    
    this.basicColor = basicColor;
  }
  
  private void create(int time, int points, int number, boolean bonus){
    this.lifetime = this.lifetime > 5000 ? 10000-points*100 : 5000;
    if(!bonus){
      for(this.i=0; this.i<number; this.i++)
        this.pointCollection.add(new Point(time, lifetime, 10, 10, this.basicColor));
    }
      
    bonus_random = floor(random(1,10));
    bonus_random_condition = floor(random(1,10));
    if(bonus_random == bonus_random_condition){
      bonus_type = floor(random(1,3));
      switch(bonus_type){
        case 1:
          this.pointBonusCollection.add(new PointBonus(time,this.lifetime,1,this.basicColor));
          break;
        case 2:
          this.pointBonusCollection.add(new PointBonus(time,this.lifetime,2,this.basicColor));
          break;
        case 3:
          this.pointBonusCollection.add(new PointBonus(time,this.lifetime,3,this.basicColor));
          break;
      }
    }
    
  }
  
  public void dessiner(int time){
    for(Point p : this.pointCollection){
      p.dessiner(time);
    }
    
    for(PointBonus p : this.pointBonusCollection){
      p.dessiner(time);
    }
  }
  
  public int hitbox(Player player, int time, int points){
    //println(pointBonusCollection.size());
    int nb_pts = -1, nb_bonus_pts=-1;
    for(PointBonus pts : this.pointBonusCollection){
      if ((player.r > pts.l && player.u < pts.d && player.r<pts.r && player.u > pts.u) || (player.l < pts.r && player.u < pts.d && player.l > pts.l && player.u > pts.u) || (player.r > pts.l && player.d > pts.u && player.r < pts.r && player.d < pts.d) || (player.l < pts.r && player.d > pts.u && player.l > pts.l && player.d < pts.d) || (pts.l >= player.l && pts.r <= player.r && pts.u >= player.u && pts.d <= player.d)) {
        this.pointBonusCleanCollection.add(pts);
        nb_bonus_pts = pts.givenPoints;
        ;
        
      }
      else if(pts.OOT()){
        this.pointBonusCleanCollection.add(pts);
        nb_bonus_pts = 100;      }
    }
    
    // pour eviter les modif de la collection durant son parcours si 2 objets sont OOT en meme temps
    if(nb_bonus_pts > 0){
      this.create(time,points,1,true);
      this.clean();
    }
    
    for(Point pts : this.pointCollection){
      if ((player.r > pts.l && player.u < pts.d && player.r<pts.r && player.u > pts.u) || (player.l < pts.r && player.u < pts.d && player.l > pts.l && player.u > pts.u) || (player.r > pts.l && player.d > pts.u && player.r < pts.r && player.d < pts.d) || (player.l < pts.r && player.d > pts.u && player.l > pts.l && player.d < pts.d) || (pts.l >= player.l && pts.r <= player.r && pts.u >= player.u && pts.d <= player.d)) {
        this.pointCleanCollection.add(pts);
        nb_pts = pts.givenPoints;
      }
      else if(pts.OOT()){
        this.pointCleanCollection.add(pts);
        nb_pts = 100+pts.givenPoints;
      }
    }
    
    if(nb_pts >= 0){
      this.create(time,points,1,false);
      this.clean();
    }
    
    
    return nb_bonus_pts > 0 ? nb_bonus_pts : (nb_pts > 0 ? nb_pts : -1);  
  }
  
  private void clean(){
   
   for(this.i=0; this.i<this.pointCleanCollection.size(); this.i++){   
      Point p = this.pointCleanCollection.get(this.i);
      this.pointCollection.remove(p); 
      //this.pointCleanCollection.remove(p);
    }
    
    for(this.i=0; this.i<this.pointBonusCleanCollection.size(); this.i++){   
      PointBonus p = this.pointBonusCleanCollection.get(this.i);
      this.pointBonusCollection.remove(p); 
      //this.pointCleanCollection.remove(p);
    }
  }
  
  
}


int h, w, life, points, counter_points;
float B_WT_X, B_WT_Y, B_WT_W, B_WT_H , B_WR_X, B_WR_Y, B_WR_W, B_WR_H , B_WB_X, B_WB_Y, B_WB_W, B_WB_H , B_WL_X, B_WL_Y, B_WL_W, B_WL_H;
String GameState;
color bgColor;


/************************************
*************************************
*        INITIALISATIONS            *
*************************************
*************************************
*/



/*
* PLAYER INITIALISATION
*/
Player player;

/*
* POINT INITIALISATION
*/
PointManager pointCollection;

/*
* WALL INITIALISATION
*/
WallManager wallCollection;
Wall WH,WB,WL,WR;
Wall B_WT;
Wall B_WR;
Wall B_WB;
Wall B_WL;

/*
* ENNEMI INITIALISATION
*/
EnnemiManager ennemiCollection;

/*
* TIMER INITIALISATION
*/
Timer timer;

/*
* COLOR SCHEME INITIALISATION
*/
color wallColor, pointColor, playerColor, ennemiColor;


/************************************
*************************************
*              SETUP                *
*************************************
*************************************/

void setup(){
  size(1000,600);

  /* COLOR SCHEME */
  bgColor = color(230);
  wallColor = color(128,214,255);
  playerColor = color(243,129,129);
  pointColor = color(250,181,122);
  ennemiColor = color(240,104,104);
  GameState = "BEFORE_GAME";


  /*
  * GLOBAL CONSTANTS FOR WALLMANAGER
  */
  B_WT_X = width/2-Wall.TAILLE/2;
  B_WT_Y = 0;
  B_WT_W = Wall.TAILLE;
  B_WT_H = height/2-Wall.BASE_GAP/2;

  B_WB_X = width/2-Wall.TAILLE/2;
  B_WB_Y = height/2+Wall.BASE_GAP/2;
  B_WB_W = Wall.TAILLE;
  B_WB_H = height-(height/2+Wall.BASE_GAP/2);

  B_WR_X = width/2+Wall.BASE_GAP/2;
  B_WR_Y = height/2-Wall.TAILLE/2;
  B_WR_W = width-(width/2+Wall.BASE_GAP/2);
  B_WR_H = Wall.TAILLE;

  B_WL_X = 0;
  B_WL_Y = height/2-Wall.TAILLE/2;
  B_WL_W = width/2-Wall.BASE_GAP/2;
  B_WL_H = Wall.TAILLE;


  /*
  * INSTANCIATIONS
  */

  //timer
  timer = new Timer();

  //player
  player = new Player(playerColor);

  //walls
  wallCollection = new WallManager(1,1,1,1,0, wallColor);

  //ennemis
  ennemiCollection = new EnnemiManager(ennemiColor);

  //points
  pointCollection = new PointManager(pointColor);
  pointCollection.create(timer.getTime(),points,1,false);


  h= height;
  w = width;

  life = 5;
  points = 0;
}


/************************************
*************************************
*               DRAW                *
*************************************
*************************************/

void draw(){
  switch(GameState){
    case "BEFORE_GAME":
      init();
      break;
    case "IN_GAME":
      play();
      break;
    case "WAIT_REVIVE":
      wait_revive();
      break;
    case "PAUSED":
      pause();
      break;
  }
}

/*
* BEFORE_GAME
*/
void init(){
  background(bgColor);
  text("VIES "+life, 10,25);
  text("POINTS "+points, width-100,25);
  timer.start();
  player.dessiner();
  wallCollection.dessiner();
  pointCollection.dessiner(timer.getTime());
}

/*
* IN_GAME
*/
void play(){
  timer.play();
  background(bgColor);

  //WALLS
  wallCollection.move(true, 1.5, true, 1.5, true, 0, true, 0);
  wallCollection.gapMove(true,true,true,true);

  wallCollection.gapModifier(0.1,0.1);
  //wallCollection.moveModifier(0.5,0.5,0,0);
  wallCollection.dessiner();

  // ENNEMIS
  ennemiCollection.create(timer.getTime());
  ennemiCollection.move();

  // POINTS
  pointCollection.dessiner(timer.getTime());

  // PLAYER INTERACTIONS
  player.move();

  // HITBOX
  hitbox();

  // DISPLAY
  text("VIES "+life, 10,25);
  text("POINTS "+points, width-100,25);
}

/*
* WAIT_REVIVE
*/
void wait_revive(){
  timer.pause();
}

/*
* PLAYER PAUSE (P)
*/
void pause(){
  timer.pause();
  text("PAUSED", width/2,25);
}


/************************************
*************************************
*           CONTROLS                *
*************************************
*************************************/

void mouseClicked(){
  switch(GameState){
    case "WAIT_REVIVE":
      GameState = "IN_GAME";
      player.dessiner();
      break;
    case "BEFORE_GAME":
      GameState = "IN_GAME";
      break;
  }
}

void keyPressed() {
  if(key == CODED){
    switch(keyCode){
      case UP:
        player.upPressed = true;
        break;
      case DOWN:
        player.downPressed = true;
        break;
      case LEFT:
        player.leftPressed = true;
        break;
      case RIGHT:
        player.rightPressed = true;
        break;
      default:
        break;
    }
  }
  else{
    if(keyCode == 90 || keyCode == 38)
      player.upPressed = true;
    else if(keyCode == 83 || keyCode == 40)
      player.downPressed = true;
    else if(keyCode == 37 || keyCode == 81)
      player.leftPressed = true;
    else if(keyCode == 68 || keyCode == 39)
      player.rightPressed = true;
  }

  if(keyCode == 80 || keyCode == 32)
    if(GameState == "IN_GAME")
      GameState = "PAUSED";
    else if(GameState == "PAUSED")
      GameState = "IN_GAME";
}

void keyReleased() {
  if(key == CODED){
    switch(keyCode){
      case UP:
        player.upPressed = false;
        break;
      case DOWN:
        player.downPressed = false;
        break;
      case LEFT:
        player.leftPressed = false;
        break;
      case RIGHT:
        player.rightPressed = false;
        break;
      default:
        break;
    }
  }
  else{
    if(keyCode == 90 || keyCode == 38)
      player.upPressed = false;
    else if(keyCode == 83 || keyCode == 40)
      player.downPressed = false;
    else if(keyCode == 37 || keyCode == 81)
      player.leftPressed = false;
    else if(keyCode == 68 || keyCode == 39)
      player.rightPressed = false;
  }
}


/************************************
*************************************
*        CHECK FOR POINT/DEATH      *
*************************************
*************************************/




/*
* Hitbox loosing life ennemi||wall / player
* Out of Bounds Player checking
* Death displaying
*/
void hitbox(){
  int nb_pts = pointCollection.hitbox(player,timer.getTime(),points);
  if(nb_pts > 0 && nb_pts < 100){
    player.lenght(1);
    player.velocity(1);
    points += nb_pts;
    counter_points+=nb_pts;
    if(counter_points>=3){
      life++;
      counter_points = 0;
    }
  }
  else if(nb_pts > 100){
    life -= nb_pts - 100;
  }

  /*
  switch(pointCollection.hitbox(player,timer.getTime(),points)){
    case "0":
      break;
    case "1":
      player.lenght(1);
      player.velocity(1);
      if(counter_points>=10){
        life++;
        counter_points = 0;
      }
      break;
    case "-1":
      life--;
      break;
  }
  */

  if(player.OOB() || ennemiCollection.hitbox(player) || wallCollection.hitbox(player)){
    life --;
    GameState = "WAIT_REVIVE";
  }
  if(life==0){
    noLoop();
    text("GAME OVER", width/2, height/2);
  }
}
