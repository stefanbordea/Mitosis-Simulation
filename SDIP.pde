ArrayList<Cell> cells = new ArrayList<Cell>();

color rectColor = 200;
int spaceBetween = 50;
int buttonWidth = 200;
int buttonHeight = 100;
int buttonRadius = 15;

int buttonPosX = width/2 - buttonWidth/2;
int buttonPosY = height/2 - 300;

PImage bg;

color rectHighlight = 100;
boolean rectOver;
Button button1;
Button button2;
Button button3;
Button smoking;
Button back;


int state = 0;

void setup() {
  size(1280, 720);
  cells.add(new Cell());
  cells.add(new Cell());
  bg = loadImage("bg.png");
  button1 = new Button("Start Simulation",width/2 - buttonWidth/2 ,height/2 - 300,buttonWidth,buttonHeight);
  button2 = new Button("Info",width/2 - buttonWidth/2 ,height/2 - 150,buttonWidth,buttonHeight);
  button3 = new Button("About The Developers",width/2 - buttonWidth/2 ,height/2 ,buttonWidth,buttonHeight);
  smoking = new Button("Smoking", 1090,60, 120, 63);
  back = new Button("Back",20, 20, 120, 63);
  state = 0;
}

void draw() {
 
  background(255);
  
  if(state == 0){
    background(bg);
    button1.display();
    button2.display();
    button3.display(); 
  }else if (state == 1){
     for (Cell cell : cells) {
     cell.move();
     cell.show();
   }
   smoking.display();
   back.display();
  } else if(state == 2) {
    back.display();
  } else if(state == 3) {
    back.display();
  }
}

void mousePressed() {
  for (int i = cells.size()-1; i >= 0; i--) {
    Cell cell = cells.get(i);
    if (cell.clicked(mouseX, mouseY)) {
      cells.add(cell.mitosis());
      cells.add(cell.mitosis());
      cells.remove(i);
    }
  }
}

void mouseClicked(){
  if(button1.overButton()){
    state = 1;
  }else if(button2.overButton()){
    state = 2;
  }else if(button3.overButton()){
    state = 3;
  } else if(back.overButton()) {
    state = 0;
  } 
}
