PImage img; 
import processing.sound.*; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
SoundFile file;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile bird;

void setup() {
  size (1200, 800);
  background (255);
  img = loadImage("mamama1800.jpg");
 // minim = new Minim(this);// initialize minim object
 // player = minim.loadFile("s1.mp3"); 
  //player2 = minim.loadFile("wind.wav"); 
  //player3 = minim.loadFile("sunet_.WAV");
  file = new SoundFile(this, "s1.mp3");
  file2 = new SoundFile(this, "s2.mp3");
  file3 = new SoundFile(this, "s3.mp3");
  file4 = new SoundFile(this, "s4.mp3");
  file5 = new SoundFile(this, "s5.mp3");
  //bird = new SoundFile(this, "bird.wav");
  //file.play();
  //file2.play();
}

void draw(){
  image(img, 0, 0); 
  loadPixels();  
  color culoare=get(mouseX, mouseY);
  println(red(culoare)+ " " + green(culoare)+ " " + blue(culoare));
  float red = red(culoare);
  float green= green(culoare);
  float blue= blue(culoare);
  
  if (green - blue < 20 && red * 2 < green) {
    if (!anyFileIsPlaying()) {
      file.play();
      println("file");
    }
  } else {
    if (file.isPlaying())
      file.pause();
  }
  
  if (red > green && green >blue && red>190) {
    if (!anyFileIsPlaying()) {
      file2.play();
      println("file2");
    }
  } else {
    if (file2.isPlaying())
      file2.pause();
  }
  
  if (red < 100 && green <100 && blue<100) {
    if (!anyFileIsPlaying()) {
      file3.play();
      println("file3");
    }
  } else {
    if (file3.isPlaying())
      file3.pause();
  }
  if (red >200 && green >200 && blue>200) {
   if (!anyFileIsPlaying()) 
     file4.play();
  } else {
    if (file4.isPlaying())
     file4.pause();
  } 
}

boolean anyFileIsPlaying() {
  return file4.isPlaying() || file3.isPlaying() || file2.isPlaying() 
    || file.isPlaying();
}