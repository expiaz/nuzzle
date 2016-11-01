public class EnnemiManager{

  private int last_spawned_ennemi, nb_ennemi_spawned, i;
  private ArrayList<Ennemi> ennemiCollection;
  private ArrayList<Ennemi> ennemiCleanCollection;
  private boolean retour;
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
