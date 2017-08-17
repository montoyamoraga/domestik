//perfecto
//by aaron montoya-moraga and guillermo montecinos
//commisioned by maria jose contreras
//v0.0.7
//august 2017

//import libraries
import ipcapture.*;
import http.requests.*;

//IPCapture cam2;
//IPCapture cam3;

//press 1 to toggle cam 1
//press 2 to toggle cam 2
//press 3 to toggle cam 3

//assume three cameras
int numberCameras = 3;

//from library ipcapture
IPCapture[] cams = new IPCapture[numberCameras];

//array for toggling showing each camera
boolean[] showCam = new boolean[numberCameras];

//array for checking if cameras are landscape mode or not
boolean[] isLandscape = new boolean[numberCameras];

//how many cameras show at the same time
int howMany = 0;

//cameras are 640 * 480;
int landscapeWidth = 640;
int landscapeHeight = 480;

int portraitWidth = 480;
int portraitHeight = 640;

void setup() {

  //size of canvas
  //size(320, 240);
  fullScreen();
  //for hiding the cursor
  noCursor();

  //change ip address here
  cams[0] = new IPCapture(this, "http://192.168.1.57/live", "", "");
  cams[1] = new IPCapture(this, "http://192.168.1.57/live", "", "");
  cams[2] = new IPCapture(this, "http://192.168.1.57/live", "", "");

  //start cameras
  for (int i = 0; i < cams.length; i++) {
    cams[i].start();
  }

  //initialize every camera to be not showing
  for (int i = 0; i < showCam.length; i++) {
    showCam[i] = false;
  }
}

void draw() {

  //reset background
  background(0);

  //get images from cameras
  readCameras();

  howManyCameras();

  displayCameras();
}

void readCameras() {

  //start cameras
  for (int i = 0; i < cams.length; i++) {
    if (cams[i].isAvailable()) {
      cams[i].read();
    }
  }
}

//determine how many cameras are being shown
void howManyCameras() {

  //reset
  howMany = 0;

  //iterate through array and count how many cameras are shown
  for (int i = 0; i < showCam.length; i++) {
    if (showCam[i] == true) {
      howMany++;
    }
  }

  //check if cameras are landscape mode or portrait mode
  for (int i = 0; i < cams.length; i++) {
    if (showCam[i] == true) {

      if (cams[i].height == 480) {
        isLandscape[i] = true;
        //println("landscape width: " + cams[i].width);
        //println("landscape height: " + cams[i].height);
      } else {
        isLandscape[i] = false;
        //println("portrait width: " + cams[i].width);
        //println("portrait height: " + cams[i].height);
      }
    }
  }
}

void displayCameras() {

  if (howMany == 0) {
    //black background
    background(0);
  } else if (howMany == 1) {
    for (int i = 0; i < cams.length; i++) {
      //check which camera should be displayed
      if (showCam[i] == true) {
        if (isLandscape[i] == true) 
        {
          //one camera in landscape mode
          imageMode(CORNER);
          image(cams[i], 0, 0, width, height);
          //println("landscape");
        } else {
          //one camera in portrait mode
          imageMode(CORNER);
          image(cams[i], 0, 0, width/2, height);
          //println("portrait");
        }
      }
    }
  } else if (howMany == 2) {
    int positioned = 0;
    for (int i = 0; i < cams.length; i++) {
      if (showCam[i] == true) {
        if (isLandscape[i] == true) 
        {
          //landscape mode
          imageMode(CORNER);
          //TODO FIX
          image(cams[i], positioned*width/2, 0, width/2, height);
          positioned++;
        } else {
          //portrait mode
          imageMode(CORNER);
          image(cams[i], positioned*width/2, 0, width/2, height);
          positioned++;
        }
      }
    }
  } else if (howMany == 3) {
    int positioned = 0;
    for (int i = 0; i < cams.length; i++) {
      if (showCam[i] == true) {
        if (isLandscape[i] == true) 
        {
          imageMode(CORNER);
          //TODO FIX
          image(cams[i], positioned*width/3, 0, width/3, height);
          positioned++;
        }
        if (isLandscape[i] == false) {
          imageMode(CORNER);
          image(cams[i], positioned*width/3, 0, width/3, height);
          positioned++;
        }
      }
    }
  }
  //grayscale filter
  filter(GRAY);
}


void keyPressed() {

  //stop cameras
  if (key == 'm') {
    for (int i = 0; i < cams.length; i++) {
      cams[i].stop();
    }
  }

  //start cameras
  if (key == 'n') {
    for (int i = 0; i < cams.length; i++) {
      cams[i].start();
    }
  }

  //toggling the showing of cameras
  //according to numbers of keyboard
  //todo: optimize using the boolean array
  if (key == '1') {
    showCam[0] = !showCam[0];
  }

  if (key == '2') {
    showCam[1] = !showCam[1];
  }

  if (key == '3') {
    showCam[2] = !showCam[2];
  }
  
  //turn off all cameras
  if (key == '0') {
    for (int i =0; i < showCam.length; i++) {
      showCam[i] = false;
    }
  }
  
  //quit program if enter/return is pressed
  if (keyCode == ENTER || keyCode == RETURN) {
    exit();
  }
  
}