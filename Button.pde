class Button{
  
  String btnName; // The text of the button
  int rectX;
  int rectY;
  int btnWidth;
  int btnHeight;
  
  
  Button(String btnName, int rectX, int rectY, int btnWidth, int btnHeight) {
    this.btnName = btnName;
    this.rectX = rectX;
    this.rectY = rectY;
    this.btnWidth = btnWidth;;
    this.btnHeight = btnHeight;
    //textSize(20);
  }
  
  void display() {
    if (overButton()) {
      stroke(0);
      fill(150);
      rect(rectX, rectY, btnWidth, btnHeight, 15);
    } else {
      stroke(0);
      fill(225);
      rect(rectX, rectY, btnWidth, btnHeight, 15);
    }
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(btnName, rectX , rectY, btnWidth, btnHeight);
    
  }
  
  boolean overButton() {
    if (mouseX >= rectX && mouseX <= rectX + btnWidth &&
        mouseY >= rectY && mouseY <= rectY + btnHeight) {
      return true;
    }
    return false;
  }
}
