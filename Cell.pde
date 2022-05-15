class Cell {
  PVector pos;
  float r;
  color cellColor;

  Cell(PVector pos, float r, color cellColor) {
    this.pos = pos.copy();
    this.r = r;
    this.cellColor = cellColor;
  }

  Cell() {
    this.pos  = new PVector(random(width), random(height));
    this.r = 20;
    this.cellColor =  color(random(90, 110), 0, random(90, 110), 100);
  }

  boolean clicked(int x, int y) {
    float d = dist(this.pos.x, this.pos.y, x, y);
    if (d < this.r) {
      return true;
    } else {
      return false;
    }
  }

  Cell mitosis() {
    Cell cell = new Cell(this.pos, this.r*0.9, this.cellColor);
    return cell;
  }

  void move() {
    PVector vel = PVector.random2D();
    this.pos.add(vel);
  }

  void show() {
    noStroke();
    fill(this.cellColor);
    ellipse(this.pos.x, this.pos.y, this.r, this.r);
    circle(this.pos.x, this.pos.y, this.r/3); 
  }
}
