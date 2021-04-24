/************************************************/
/*             Car 2D in Processing             */
/************************************************/





/************************************************/
/*                   Variables                  */
/************************************************/
// gameScreen : select Screen
// difficulty : game`s difficulty (1 ~ 3)
// scroll : scroll the background image infinity
// scrollSpeed : background image scroll speed

int gameScreen = 0;
int difficulty = 2;
float scroll = 0;
float scrollSpeed = 15.0;

boolean bAccel, bBrake, bLeft, bRight;

PImage menuScreenImg;
PImage gameScreenImg;
PImage settingScreenImg;

color buttonColor = color(160, 160, 160, 200);

Button startBtn;
Button exitBtn;
Button settingBtn;
Button difficultyEasyBtn;
Button difficultyNormalBtn;
Button difficultyHardBtn;
Button previousBtn;

Car myCar;

void setup() {
  size(720, 480);
  smooth();
  frameRate(30);
  rectMode(CENTER);
  setImages(); // load images
  setButton(); // create Button
  myCar = new Car(360, 240, 40, 60, color(255, 100, 100));
}

void draw() {
  background(255); // Screen Initialize

  // menu Screen
  if (gameScreen == 0) {
    menuScreen();
  }

  // game Screen
  else if (gameScreen == 1) {
    gameScreen();
  }

  // setting Screen
  else if (gameScreen == 2) {
    settingScreen();
  }
}

/************************************************/
/*                  Initialize                  */
/************************************************/

void setImages() {
  menuScreenImg = loadImage("menuScreenImg.png");
  gameScreenImg = loadImage("gameScreenImg.png");
  settingScreenImg = loadImage("settingScreenImg.jpg");
}

void setButton() {
  startBtn = new Button(360, 260, 100, 40, "START", buttonColor);
  settingBtn = new Button(360, 320, 100, 40, "Setting", buttonColor);
  exitBtn = new Button(360, 380, 100, 40, "EXIT", buttonColor);
  difficultyEasyBtn = new Button(190, 400, 100, 40, "Easy", buttonColor);
  difficultyNormalBtn = new Button(310, 400, 100, 40, "Normal", buttonColor);
  difficultyHardBtn = new Button(430, 400, 100, 40, "Hard", buttonColor);
  previousBtn = new Button(50, 400, 100, 40, "Previous", buttonColor);
}

/************************************************/
/*                   SCREEN                     */
/************************************************/

void menuScreen() {
  /**** Background *****/
  tint(255, 230); // tint(gray, alpha);
  image(menuScreenImg, 0, 0, width, height);
  noTint();

  /****** Button ******/
  startBtn.create();
  settingBtn.create();
  exitBtn.create();
}

void gameScreen() {
  /**** Background *****/
  image(gameScreenImg, 0, scroll, width, height);
  image(gameScreenImg, 0, scroll-height, width, height);

  scroll += scrollSpeed;
  if (scroll >= height) scroll = 0;

  /**** Objects *****/
  //rect(400,380,40,60, color(0,255,0));

  myCar.move();
  //println(myCar.carX + ", " + myCar.carY);
}

void settingScreen() {
  /**** Background *****/
  tint(255, 200);
  image(settingScreenImg, 0, 0, width, height);
  noTint();

  /****** Button ******/
  difficultyEasyBtn.create();
  difficultyNormalBtn.create();
  difficultyHardBtn.create();
  previousBtn.create();
}


/************************************************/
/*                   EVENT                      */
/************************************************/

public void mousePressed() {
  // process in muneScreen
  if (gameScreen == 0) {
    if (startBtn.isClicked(mouseX, mouseY)) {
    } else if (settingBtn.isClicked(mouseX, mouseY)) {
    } else if (exitBtn.isClicked(mouseX, mouseY)) {
    }
  }
  // process in gameScreen
  else if (gameScreen == 1) {
  }
  // process in settingScreen
  else if (gameScreen == 2) {
    if (previousBtn.isClicked(mouseX, mouseY)) {
    } else if (difficultyEasyBtn.isClicked(mouseX, mouseY)) {
    } else if (difficultyNormalBtn.isClicked(mouseX, mouseY)) {
    } else if (difficultyHardBtn.isClicked(mouseX, mouseY)) {
    }
  }
  println("mousePressed() Event is called (" + mouseX + ", " + mouseY + ")");
}

public void mouseReleased() {
  // process in muneScreen
  if (gameScreen == 0) {
    if (startBtn.isClicked(mouseX, mouseY)) {
      startBtn.btnColor = buttonColor; // the color of button is return to origin
      gameScreen = 1;
    } else if (settingBtn.isClicked(mouseX, mouseY)) {
      settingBtn.btnColor = buttonColor; // the color of button is return to origin
      gameScreen = 2;
    } else if (exitBtn.isClicked(mouseX, mouseY)) {
      exit();
    }
  }

  // process in gameScreen
  else if (gameScreen == 1) {
  }

  // process in settingScreen
  else if (gameScreen == 2) {
    if (previousBtn.isClicked(mouseX, mouseY)) {
      previousBtn.btnColor = buttonColor; // the color of button is return to origin
      gameScreen = 0;
    } else if (difficultyEasyBtn.isClicked(mouseX, mouseY)) {
      difficultyEasyBtn.btnColor = buttonColor; // the color of button is return to origin
      difficulty = 1;
    } else if (difficultyNormalBtn.isClicked(mouseX, mouseY)) {
      difficultyNormalBtn.btnColor = buttonColor; // the color of button is return to origin
      difficulty = 2;
    } else if (difficultyHardBtn.isClicked(mouseX, mouseY)) {
      difficultyHardBtn.btnColor = buttonColor; // the color of button is return to origin
      difficulty = 3;
    }
  }
  println("mousRealesed() Event is called (" + mouseX + ", " + mouseY + ")");
}

public void keyPressed() {
  // process in menuScreen
  if (gameScreen == 0) {
  }

  // process in gameScreen
  if (gameScreen == 1) {
    if (key == CODED) {
      if (keyCode == UP) {
        println("bAccel");
        bAccel = true;
      }
      if (keyCode == LEFT) {
        println("bLeft");
        bLeft = true;
      }
      if (keyCode == RIGHT) {
        println("bRight");
        bRight = true;
      }
      if (keyCode == DOWN) {
        println("bBrake");
        bBrake = true;
      }
    } else if (keyCode == 32) { // SpaceBar
      println(scrollSpeed);
      scrollSpeed = 5;
    } else if (keyCode == 80) { // P
      println("pause");
    }

    //test code
    //print(keyCode);
  }

  // process in settingScreen
  if (gameScreen == 2) {
  }
}

public void keyReleased() {
  // process in menuScreen
  if (gameScreen == 0) {
  }

  // process in gameScreen
  if (gameScreen == 1) {
    if (keyCode == 32) {
      println(scrollSpeed);
      scrollSpeed = 15;
    }
    if (key == CODED) {
      if (keyCode == UP) {
        bAccel = false;
      }
      if (keyCode == LEFT) {
        bLeft = false;
      }
      if (keyCode == RIGHT) {
        bRight = false;
      }
      if (keyCode == DOWN) {
        bBrake = false;
      }
    }

    // process in settingScreen
    if (gameScreen == 2) {
    }
  }
}

/************************************************/
/*                   CLASS                      */
/************************************************/

class Button {
  int btnX; // X position of Button
  int btnY; // Y position of Button
  int btnW; // Width of Button
  int btnH; // height of Button
  color btnColor; // color of Button
  String btnName; // name of Button

  // constructor
  public Button(int inputX, int inputY, int inputW, int inputH, String inputName, color inputColor) {
    this.btnX = inputX;
    this.btnY = inputY;
    this.btnW = inputW;
    this.btnH = inputH;
    this.btnColor = inputColor;
    this.btnName = inputName;
  }

  //create Button
  void create() {
    noStroke();
    fill(btnColor);
    rect(btnX, btnY, btnW, btnH);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(btnName, btnX, btnY);
  }

  boolean isClicked(int inputX, int inputY) {
    //
    if (btnX < inputX && inputX < btnX + btnW && btnY < inputY && inputY < btnY + btnH) {
      /**** When button is clicked, ***********/
      /**** the color of button is changed ****/
      float r = red(this.btnColor);
      float g = green(this.btnColor);
      float b = blue(this.btnColor);
      this.btnColor = color(r-50, g-50, b-50);
      /**********/
      return true;
    } else
      return false;
  }
}

class Car {
  int carX;
  int carY;
  int carW;
  int carH;
  float carSpeed = 0.0;
  float carRot = 0.0;
  color carColor;

  float inertia; // gwanseong

  public Car(int startX, int startY, int inputW, int inputH, color inputColor) {
    carX = startX; // car spawn X position
    carY = startY; // car spawn Y position
    carW = inputW;
    carH = inputH;
    carColor = inputColor;
  }

  void load() {
    pushMatrix();
    fill(carColor);
    translate(carX, carY);
    rotate(carRot);
    rect(carX, carY, carW, carH);
    popMatrix();
  }

  void move() {
    if (bAccel == true) {
      carSpeed = inertia -= .05;
    }
    if (bLeft == true) {
      carRot += .025;
    }
    if (bRight == true) {
      carRot -= .025;
    }
    if (bBrake == true) {
      carSpeed += .05;
    }
    else {
     carSpeed += .025;
    }

    carSpeed = constrain(carSpeed, -6, 2); // speed -2 ~ 6
    carX += sin(carRot) * carSpeed;
    carY += cos(carRot) * carSpeed;
    load();
    println(carRot);
  }
}