import java.util.Collections;

class Cell implements Comparable<Cell>{
  PVector pos;
  float radius;
  color cellColor;
  int lifeTime;
  

  
  Cell(PVector pos, float radius, color cellColor) {
    this.pos = pos.copy();
    this.radius = radius;
    this.cellColor = cellColor;
    this.lifeTime = 0;
  }

  Cell() {
    this.pos  = new PVector(random(140 + radius, width - 190 - radius), random(radius, height - radius));
    this.radius = 20;
    this.cellColor =  color(random(90, 110), 0, random(90, 110), 100);
  }

  boolean clicked(int x, int y) {
    float d = dist(this.pos.x, this.pos.y, x, y);
    if (d < this.radius) {
      return true;
    } else {
      return false;
    }
  }

  Cell mitosis() {
    Cell cell = new Cell(this.pos, this.radius, this.cellColor);
    return cell;
  }

  void move() {
    PVector vel = PVector.random2D();
    this.pos.add(bounceOnEdges(vel));
  }

  @Override
  int compareTo(Cell other) {
    return this.lifeTime - other.lifeTime;
  }
    
    
    
  void show() {
    
    lifeTime++;
    noStroke();
    fill(this.cellColor);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    circle(this.pos.x, this.pos.y, this.radius/3); 
    //die();
  }
  
  PVector bounceOnEdges(PVector vel) {
    if(pos.x <= 140 + radius){
      if (vel.x < 0) vel.x *= -1;
    }
    if(pos.x >= width - 190 -radius) {
      if(vel.x > 0) vel.x *= -1;
    }
    if (pos.y <= radius) {
      if (vel.y < 0 )vel.y *= -1;
    }
    if(pos.y >= height - radius) {
      if (vel.y > 0 )vel.y *= -1;
    }
    return vel;
    
  }
}
