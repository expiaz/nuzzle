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