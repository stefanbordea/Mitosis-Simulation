class CancerCell extends Cell{
  color cancerCellColor =color(random(10, 30), random(10,30), random(10, 30), 100); 

  
  CancerCell(PVector pos, float radius, color cancerCellColor) {
    super(pos,radius,cancerCellColor);

  }
  
  CancerCell() {
     super();
     this.cancerCellColor = cancerCellColor;

  }
  
  CancerCell(color cellColor){
   super();
   this.cancerCellColor = cellColor;
   //this.pos = 
  }
    
  @Override
  void show() {
    lifeTime++;
    noStroke();
    fill(this.cancerCellColor);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    circle(this.pos.x, this.pos.y, this.radius/3); 
    //die();
  }
  
  void move() {
    PVector vel = PVector.random2D();
    vel.limit(2);
    this.pos.add(bounceOnEdges(vel));
    
  }
  
  CancerCell cancerMitosis() {
   
    CancerCell cell = new CancerCell(this.pos, this.radius,this.cancerCellColor); 
    
    return cell;
  }
  
}
