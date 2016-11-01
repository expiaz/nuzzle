public class PointBonus extends Point{
  
  String bonusType;
  
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