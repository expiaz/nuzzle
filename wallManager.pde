public class WallManager{
  ArrayList<Wall> WT;
  ArrayList<Wall> WB;
  ArrayList<Wall> WR;
  ArrayList<Wall> WL;
  int i, appW, appH;
 
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
        wl.gap(false,true,false);
      }
      
      for(Wall wl : WB){ //bottom
        if(wl.y <= 0 + wl.gap && wl.depla_gap < 0){ // haut
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.y >= appH && wl.depla_gap > 0){ //bas
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap(false,true,true);
      }
      
      for(Wall wl : WL){ //left
        if(wl.w <= 0 && wl.depla_gap < 0){ // haut
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.w >= appW-wl.gap && wl.depla_gap > 0){ //bas
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap(true,false,false);
      }
      
      for(Wall wl : WR){ //right
        if(wl.x <= 0+wl.gap && wl.depla_gap < 0){
          wl.depla_gap = abs(wl.depla_gap);
        }
        if(wl.x >= appW && wl.depla_gap > 0){
          wl.depla_gap = - wl.depla_gap;
        }
        wl.gap(true,false,true);
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
          wl.gap(false,true,false);
        }
      }
      else{
        for(Wall wl : WT){ //top
          wl.gap(false,true,false);
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
          wl.gap(true,false,true);
        }
      }
      else{
        for(Wall wl : WR){ //right
          wl.gap(false,false,false);
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
          wl.gap(false,true,true);
        }
      }
      else{
        for(Wall wl : WB){ //bottom
          wl.gap(false,false,false);
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
          wl.gap(true,false,false);
        }
      }
      else{
        for(Wall wl : WL){ //left
          wl.gap(false,false,false);
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