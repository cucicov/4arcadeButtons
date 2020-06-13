PImage img; 
import processing.sound.*; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
SoundFile file;
color culoare; 
int[][] mamama = {{10143, 18960}, 
  {20782, 23970}, 
  {36239 ,37276  },
  {39420,42472 },
  {44025,45336 },
  {47692,56620 },
  {68323, 69146}
 };
int[][] maria = {{18960, 20782}, 
  {23970, 26038}
 };
int[][] lau = {{26038, 36239}, 
  {37276 , 39420}, 
  {42472, 44025},
  {45336,47692 },
  {56620,68323 },
  {69146,150000 }
  };
int counterMamama = -1;
int counterMaria = -1;
int counterLau = -1;

String currentPerson = "";

void setup() {
  size (1200, 800);
  background (255);
  img = loadImage("mamama_bucatarie1200.jpg");
  minim = new Minim(this);// initialize minim object
  player = minim.loadFile("discutie_bucatarie.mp3"); 
  player.play();
  //player.play();
}

void draw() {
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
  
  if (red>80 && green<70 && blue<30){ 
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
  if (red>130 && green>100 && blue<150){
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

void skipPlayer(int skipPosition) {
  int currentPositionPlayer = player.position();
  int diffPosition = currentPositionPlayer - skipPosition;
  println("skipTo:" + diffPosition);
  player.skip(-diffPosition);
  println("position:" + player.position());
}

void mousePressed(){
  //println("red: " + red(culoare) + "green:" +green(culoare) + "blue: "+ blue(culoare));
  
}
