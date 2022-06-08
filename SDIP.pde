ArrayList<Cell> cells = new ArrayList<Cell>();

color rectColor = 200;
int spaceBetween = 50;
int buttonWidth = 200;
int buttonHeight = 100;
int buttonRadius = 15;
boolean flag = true;
String info="";

int buttonPosX = width/2 - buttonWidth/2;
int buttonPosY = height/2 - 300;

PImage bg;
PImage disclaimer;

color rectHighlight = 100;
boolean rectOver;
Button button1;
Button button2;
Button button3;


int state = 0;

void setup() {
  size(1280, 720);
  cells.add(new Cell());
  cells.add(new Cell());
  bg = loadImage("bg.png");
  disclaimer = loadImage("disclaimer.png");
  button1 = new Button("Start Simulation", width/2 - buttonWidth/2, height/2 - 300, buttonWidth, buttonHeight);
  button2 = new Button("Info", width/2 - buttonWidth/2, height/2 - 150, buttonWidth, buttonHeight);
  button3 = new Button("About The Developers", width/2 - buttonWidth/2, height/2, buttonWidth, buttonHeight);
  smoking = new Button("Smoking", 1090, 80, 120, 63);
  sunExposure = new Button("Sun Exposure", 1090, 200, 120, 63);
  alcohol = new Button("Alchohol", 1090, 320, 120, 63);
  back = new Button("Back", 20, 20, 120, 63);
  state = 0;
  modCounter = 300;
  toBeAdded = new ArrayList<CancerCell>();
  
}

void draw() {
  System.out.println(cells.size() + " " + deleteFaster());
  //if(toBeAdded != null){
  //cancerCells.add(toBeAdded);
  //}

  background(255);
  
  if(state == 0){
    background(bg);
    button1.display();
    button2.display();
    button3.display();
    info="";
  } else if (state == 1) {
    disclaimer.resize(50,50);
  image(disclaimer,1000,500);
    for (Cell cell : cells) {
      if (cell.lifeTime > random(700, 2500)) {
        toBeDeleted = cell;
      }
      cell.move();
      cell.show();
    }

    createCancerCells(cancerCellsSun);
    createCancerCells(cancerCells);
    createCancerCells(cancerCellsAlcohol);
  
  if (cancerCellsSun.isEmpty()&&cancerCells.isEmpty()&&cancerCellsAlcohol.isEmpty()){
         info="These are healthy cells. Click on the cells to see the Mitosis process. Or click on the buttons above to simulate the growth of cancer cells";
     }
  else if (!(cancerCellsSun.isEmpty())||!(cancerCells.isEmpty())||!(cancerCellsAlcohol.isEmpty())) {
       info="These cancer cells blocks our immune system's capability to repair our damaged cells.These do not stop dividing";
     }
     textAlign(LEFT);
     stroke(10);
     text(info, 900,500, 300,100); 
     
    smoking.display();
    back.display();
    sunExposure.display();
    alcohol.display();

  } else if (state == 2) {
    back.display();
  } else if (state == 3) {
    back.display();
  }
  
  //text(info,1150,1150,640,670);
     //text(info,1100,670);
     
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
  }
}
