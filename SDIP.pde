ArrayList<Cell> cells = new ArrayList<Cell>();
ArrayList<CancerCell> cancerCells = new ArrayList<CancerCell>();
ArrayList<CancerCell> cancerCellsSun = new ArrayList<CancerCell>();
ArrayList<CancerCell> cancerCellschemicals = new ArrayList<CancerCell>();
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
Button smoking;
Button sunExposure;
Button chemicals;
Button back;

Cell toBeDeleted;
ArrayList<CancerCell> toBeAdded ;

int state = 0;
int modCounter;


void setup() {
  frameRate = 60;
  size(1280, 720);
  //cells.add(new Cell());
  //cells.add(new Cell());
  

  bg = loadImage("bg.png");
  disclaimer = loadImage("disclaimer.png");
  button1 = new Button("Start Simulation", width/2 - buttonWidth/2, height/2 - 300, buttonWidth, buttonHeight);
  button2 = new Button("Info", width/2 - buttonWidth/2, height/2 - 150, buttonWidth, buttonHeight);
  button3 = new Button("About The Developers", width/2 - buttonWidth/2, height/2, buttonWidth, buttonHeight);
  smoking = new Button("Smoking", 1090, 80, 120, 63);
  sunExposure = new Button("Sun Exposure", 1090, 200, 120, 63);
  chemicals = new Button("Chemicals", 1090, 320, 120, 63);
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
  if (cells.size() >5 && frameCount % deleteFaster() == 0) {
    cells.remove(toBeDeleted);
  }

  // Collections.sort(cells);
  if (state == 0) {
    background(bg);
    button1.display();
    button2.display();
    button3.display();
    info="";
  } else if (state == 1) {
    disclaimer.resize(50,50);
  image(disclaimer,1000,500);
  } else if (state == 1) {
      background(160);
    for (Cell cell : cells) {
      if (cell.lifeTime > random(700, 2500)) {
        toBeDeleted = cell;
      }
      cell.move();
      cell.show();
    }
  if (cancerCellsSun.isEmpty()&&cancerCells.isEmpty()&&cancerCellsAlcohol.isEmpty()){
         info="These are healthy cells. Click on the cells to see the Mitosis process. Or click on the buttons above to simulate the growth of cancer cells";
     }
  else if (!(cancerCellsSun.isEmpty())||!(cancerCells.isEmpty())||!(cancerCellsAlcohol.isEmpty())) {
       info="These cancer cells blocks our immune system's capability to repair our damaged cells.These do not stop dividing";
     }
     textAlign(LEFT);
     stroke(10);
     text(info, 900,500, 300,100); 


    createCancerCells(cancerCellsSun);
    createCancerCells(cancerCells);
    createCancerCells(cancerCellschemicals);
    smoking.display();
    back.display();
    sunExposure.display();
    chemicals.display();
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
    
    for (Cell checkCell : cells) {
      flag = true;
      if (dist(cell.pos.x, cell.pos.y, checkCell.pos.x, checkCell.pos.y) <= cell.radius && cell.pos != checkCell.pos) {
        flag = false;
        break;
      }
    }
    if (cell.clicked(mouseX, mouseY) && flag) {
      cells.add(cell.mitosis());
      cells.add(cell.mitosis());
      cells.remove(i);
    }
  }
  
}

int deleteFaster() {
  if (cells.size() > 110) {
    return 100;
  } else if (cells.size()<50 ) {
    return 500;
  }
  return modCounter;
}

void mouseReleased() {
  if (button1.overButton() && state == 0) {
    state = 1;
    for (int i = 0; i <= 100; i++) {
    cells.add(new Cell());
    }
  } else if (button2.overButton() && state == 0) {
    state = 2;
  } else if (button3.overButton() && state == 0) {
    state = 3;
  } else if (back.overButton()) {
    state = 0;
    cells.clear();
    cancerCells.clear();
    cancerCellsSun.clear();
    cancerCellschemicals.clear();
    
  }

  if (smoking.overButton() && state == 1) {
    cancerCells.add(new CancerCell(color(random(10, 30), random(10, 30), random(10, 30), 150)));
  }
  if(sunExposure.overButton() && state ==1){
    cancerCellsSun.add(new CancerCell(color(181, 14, 14, 130)));
  }
  if(chemicals.overButton() && state ==1){
    cancerCellschemicals.add(new CancerCell(color(0, 128, 18, 150)));
  }
}

void createCancerCells(ArrayList<CancerCell> cancerCells){
  
for (CancerCell cancerCell : cancerCells) {
      if (cancerCell.lifeTime > random(300, 1000) && frameCount % 600==0) {
        cancerCell.lifeTime = 0;
        toBeAdded.add(cancerCell.cancerMitosis(cancerCell.cancerCellColor));
      }
      cancerCell.move();
      cancerCell.show();
    }
      for (CancerCell cancerC : toBeAdded) {
      cancerCells.add(cancerC);
    }
    toBeAdded.removeAll(toBeAdded);
}
