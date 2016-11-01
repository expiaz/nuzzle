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