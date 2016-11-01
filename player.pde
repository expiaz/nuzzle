public class Player {

  public int w, h, x, y, appW, appH, r, l, d, u, upgrade_velocity_counter;
  private int velocity;
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