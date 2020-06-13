import processing.serial.*;

Serial myPort;  // Create object from Serial class
int arduinoValue;     // Data received from the serial port
int activeButton = 0;

// geam
import processing.sound.*; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
SoundFile file;
SoundFile file2;
color culoare; 

// bucatarie
int[][] mamama = {{10143, 18960}, 
  {20782, 23970}, 
  {36239, 37276  }, 
  {39420, 42472 }, 
  {44025, 45336 }, 
  {47692, 56620 }, 
  {68323, 69146}
};
int[][] maria = {{18960, 20782}, 
  {23970, 26038}
};
int[][] lau = {{26038, 36239}, 
  {37276, 39420}, 
  {42472, 44025}, 
  {45336, 47692 }, 
  {56620, 68323 }, 
  {69146, 150000 }
};
int counterMamama = -1;
int counterMaria = -1;
int counterLau = -1;

String currentPerson = "";


// frigider
PImage img; 
BandPass bandPass; 


void setup()
{
  size (1200, 800);
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[7]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  printArray(Serial.list());
}

void draw() {
  if ( myPort.available() > 0) {  // If data is available,
    try {
      arduinoValue = Integer.valueOf(trim(myPort.readStringUntil('\n')));         // read it and store it in val
      if (arduinoValue != 0 && activeButton != arduinoValue) {
        activeButton = arduinoValue;
        println(activeButton);
        init(activeButton);
      }
    } 
    catch (Exception ex) {
      // nothings
      println(ex.getMessage());
    }
  } 

  // scenario1
  if (activeButton == 1) {
    image(img, 0, 0);
    loadPixels();  
    color culoare=get(mouseX, mouseY);
    println(brightness(culoare));

    if (brightness(culoare) <=150) {
      if (player.isPlaying()) {
        player.pause();
        println("pause");
      }
      if (!player2.isPlaying()) 
      {
        player2.play();
      }
    } 
    if (brightness(culoare) >150) {
      if (player2.isPlaying()) {
        player2.pause();
        println("pause");
      }
      if (!player.isPlaying()) 
      {
        player.play();
      }
    }
  }

  // scenario2
  if (activeButton == 2) {
    image(img, 0, 0);
    loadPixels();  
    //println(player.position());
    culoare=get(mouseX, mouseY);
    // if (player.isPlaying()) {
    // println( player.position());
    //}

    if (keyPressed) {
      if (key == ENTER) {
        if (player.isPlaying()) {
          player.pause();
          println("pause" + player.position());
        }
      }
      if (key == TAB) {
        if (!player.isPlaying()) {

          player.play();
        }
      }
      if (key == BACKSPACE ) {
        player.skip(-500);
        player.pause();
        println("-------" + player.position());
      }
    }
    float red = red(culoare);
    float green = green(culoare);
    float blue = blue(culoare);

    if (red>80 && green<70 && blue<30) { 
      //println("red");
      if (currentPerson != "mamama") {
        currentPerson = "mamama";
        if (counterMamama < mamama.length-1) {
          counterMamama++;
        } else {
          counterMamama = 0;
        }
        skipPlayer(mamama[counterMamama][0]);
      }
      if (player.position() >= mamama[counterMamama][1]) {
        skipPlayer(mamama[counterMamama][0]);
      }
    }
    if (red>150 && green>150 && blue>150) {
      //println("white");
      if (currentPerson != "maria") {
        currentPerson = "maria";
        if (counterMaria < maria.length-1) {
          counterMaria++;
        } else {
          counterMaria = 0;
        }
        skipPlayer(maria[counterMaria][0]);
      }
      if (player.position() >= maria[counterMaria][1]) {
        skipPlayer(maria[counterMaria][0]);
      }
    }
    if (red>130 && green>100 && blue<150) {
      //println("yellow");
      if (currentPerson != "lau") {
        currentPerson = "lau";
        if (counterLau < lau.length-1) {
          counterLau++;
        } else {
          counterLau = 0;
        }
        skipPlayer(lau[counterLau][0]);
      }
      if (player.position() >= lau[counterLau][1]) {
        skipPlayer(lau[counterLau][0]);
      }
    }
  }

  // scenario3
  if (activeButton == 3) {
    image(img, 0, 0);
    loadPixels();  
    color culoare=get(mouseX, mouseY);
    //println(brightness(culoare));
    file.amp(map(brightness(culoare), 0, 255, 0, 0.8));
  }

  // scenario4
  if (activeButton == 4) {
  }
}

void init(int scenario) {
  if (player != null && player.isPlaying()) {
    player.pause();
  }
  if (player2 != null && player2.isPlaying()) {
    player2.pause();
  }
  if (file != null && file.isPlaying()) {
    file.pause();
  }
  // scenario1
  if (scenario == 1) {
    img = loadImage("geam_1200.jpg");
    minim = new Minim(this);// initialize minim object
    player = minim.loadFile("geam.mp3"); 
    player.play();
    player2 = minim.loadFile("s1.mp3"); 
    //player.play();
  }

  // scenario2
  if (scenario == 2) {
    img = loadImage("mamama_bucatarie1200.jpg");
    minim = new Minim(this);// initialize minim object
    player = minim.loadFile("discutie_bucatarie.mp3"); 
    player.play();
  }

  // scenario3
  if (scenario == 3) {
    img = loadImage("podea.jpg");
    file = new SoundFile(this, "frigider.wav");
    file.play();
  }

  // scenario4
  if (scenario == 4) {
  }
}

void skipPlayer(int skipPosition) {
  int currentPositionPlayer = player.position();
  int diffPosition = currentPositionPlayer - skipPosition;
  println("skipTo:" + diffPosition);
  player.skip(-diffPosition);
  println("position:" + player.position());
}