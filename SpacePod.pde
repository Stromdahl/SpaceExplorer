class SpacePod {
  PVector pos;
  PVector vel;
  PVector acc;

  int power;
  int minPower = 20;
  int maxPower = 100;

  int tankHeight;
  int minTankHeight = 20;
  int maxTankHeight = 100;

  int fuel;

  int W, H;
  int halfW, halfH;

  public SpacePod(int x, int y, int power, int tH) {
    this.pos = new PVector(x, y);
    this.vel = new PVector();
    this.acc = new PVector();

    this.power = (int)clamp((float)power, (float)this.minPower, (float)this.maxPower);
    this.tankHeight = (int)clamp((float)tH, (float)this.minTankHeight, (float)this.maxTankHeight);

    this.fuel = power*tankHeight;

    this.W = this.power;
    this.H = this.tankHeight;
    this.halfW = this.W/2;
    this.halfH = this.H/2;
  }

  void update() {
    this.pos.add(vel);
    this.vel.add(acc);
    this.acc.mult(0);
  }



  //triangle(x1, y1, x2, y2, x3, y3)
  //quad(x1, y1, x2, y2, x3, y3, x4, y4)

  void render() {
    pushMatrix();  
    translate(this.pos.x, this.pos.y);

    triangle(-this.halfW, -this.halfH, this.halfW, -this.halfH, 0, -this.H);
    rect(-this.halfW, -this.halfH, this.W, this.H);
    quad(-(this.halfW * 0.9), this.halfH, this.halfW*0.9,this.halfH, -this.halfW, this.halfH+10, this.halfW, halfH+10);

    popMatrix();
  }
}