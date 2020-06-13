PImage img; 
import processing.sound.*; 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
SoundFile file;
SoundFile file2;
color culoare; 

void setup() {
  size (1200, 800);
  background (255);
  img = loadImage("geam_1200.jpg");
  minim = new Minim(this);// initialize minim object
  player = minim.loadFile("geam.mp3"); 
  player.play();
  player2 = minim.loadFile("pasi.mp3"); 
  //player.play();
}

void draw() {
  image(img, 0, 0);
  loadPixels();  
  color culoare=get(mouseX, mouseY);
  println(brightness(culoare));
  
 if (brightness(culoare) <=150) {
     if (player.isPlaying()){
     player.pause();
     println("pause");
     }
     if (!player2.isPlaying()) 
     {
     player2.play();
     }
    } 
if (brightness(culoare) >150) {
     if (player2.isPlaying()){
     player2.pause();
     println("pause");
     }
     if (!player.isPlaying()) 
     {
     player.play();
     }
    } 
 
}  