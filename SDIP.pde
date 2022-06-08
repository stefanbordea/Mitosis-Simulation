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
String infoText="";

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
String text[]= {
  "These are healthy cells. Click on the cells to see the Mitosis process. Or click on the buttons above to simulate the growth of cancer cells", 
  "These cancer cells blocks our immune system's capability to repair our damaged cells.These do not stop dividing", 
  "Did you know that 10 million people die from cancer every year?", 
  "Did you know that cancer is the 2nd leading cause of death worldwide?"};

Cell toBeDeleted;
ArrayList<CancerCell> toBeAdded ;

int state = 0;
int modCounter;

String info;
String info2;
String info3;
String info4;
String info5;
String info6;
String info7;
//cells to be displayed in the info page
Cell healthyInfoCell;
CancerCell smokingInfoCell;
CancerCell sunExposureInfoCell;
CancerCell chemicalInfoCell;

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
  info = "Hello and welcome to our simulation. The purpose of this simulation is to show in an abstract and interactive way how healthy cells can be affected by different external factors. For this simulation, we provide 3 buttons of external factors that can potentially cause cancer: Smoking, Sun Exposure and Chemicals. Through these buttons, the user can generate cancerous cells and see how they spread and interact with healthy ones.";
  info2 = "Healthy human cells perform mitosis, a process that is initiated by a signal from the body, where the cell divides itself into 2 identical cells before dying. Cancer cells, on the other hand, do not die and keep on multiplying, resulting in a cancerous mass. In the simulation, the signal for healthy cells to perform mitosis is given by the user by clicking on a healthy cell. However, if that cell is too close to other cells it will not perform the mitosis.";
  info3 = "Different cells are represented by different colors, as such :";
  info4 = "Healthy Cells:";
  info5 = "Smoking:";
  info6 = "Sun Exposure:";
  info7 = "Chemicals:";

}

void draw() {

  //System.out.println("Frame Count: "+frameCount);
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
    infoText="";
  } else if (state == 1) {
    background(160);
    disclaimer.resize(30, 30);
    image(disclaimer, 20, 530);
    for (Cell cell : cells) {
      if (cell.lifeTime > random(700, 2500)) {
        toBeDeleted = cell;
      }
      cell.move();
      cell.show();
    }

    if (cancerCellsSun.isEmpty()&&cancerCells.isEmpty()&&cancerCellschemicals.isEmpty()) {
      infoText=text[0];
    } else if ((!(cancerCellsSun.isEmpty())||!(cancerCells.isEmpty())||!(cancerCellschemicals.isEmpty()))&& frameCount<700) {
      infoText=text[1];
    } else if  ((!(cancerCellsSun.isEmpty())||!(cancerCells.isEmpty())||!(cancerCellschemicals.isEmpty()))&&(frameCount >=700 && frameCount <=1200)) {
      infoText = text[2];
    } else infoText=text[3];


    //System.out.println(""+info);
    textAlign(LEFT);
    fill(211);
    textSize(14);
    text(infoText, 20, 560, 320, 100); 

    //

    createCancerCells(cancerCellsSun);
    createCancerCells(cancerCells);
    createCancerCells(cancerCellschemicals);
    smoking.display();
    back.display();
    sunExposure.display();
    chemicals.display();
  } else if (state == 2) {
    background(160);
    fill(0);
    textAlign(LEFT);
    textSize(23);
    text(info, 200, 50, 1000, 230);
    text(info2, 200, 250, 1000, 310);
    text(info3, 200, 440, 1000, 700);
    text(info4, 200, 495, 1000, 700);
    text(info5, 200, 535, 1000, 700);
    text(info6, 200, 573, 1000, 700);
    text(info7, 200, 610, 1000, 700);
    healthyInfoCell = new Cell(new PVector(355,513),20,color(random(90, 110), 0, random(90, 110), 100));
    healthyInfoCell.show();
    
    smokingInfoCell = new CancerCell(new PVector(355, 553),20,color(random(10, 30), random(10, 30), random(10, 30), 150));
    smokingInfoCell.show();
    
    sunExposureInfoCell = new CancerCell(new PVector(355, 592),20,color(181, 14, 14, 130));
    sunExposureInfoCell.show();

    chemicalInfoCell = new CancerCell(new PVector(355,625),20,color(0, 128, 18, 150));
    chemicalInfoCell.show();

    // text(info4, 330, 200, 650, 590);
    // text(info5, 330, 200, 650, 590);
    // fill(0);
    back.display();
  } else if (state == 3) {
    back.display();
  String s = "This simulation was created by four Computer Science students:\n Daniel Dimitriou,\n Minkyeong Youn,\n Dionysis Petrotos,\n Stefan Bordea,\n as coursework for the class \"Sofware Development in Practice\"";
  fill(0);
  text(s, 500, 100, 280, 320);  // Text wraps within text box
  }
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
  if ((mouseX <=50 && mouseX>=20) && (mouseY<=560 &&mouseY>=530)) {
    state =2;

    /*disclaimer.resize(30, 30);
     image(disclaimer, 1050, 480);
     */
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
  if (sunExposure.overButton() && state ==1) {
    cancerCellsSun.add(new CancerCell(color(181, 14, 14, 130)));
  }
  if (chemicals.overButton() && state ==1) {
    cancerCellschemicals.add(new CancerCell(color(0, 128, 18, 150)));
  }
}

void createCancerCells(ArrayList<CancerCell> cancerCells) {

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
