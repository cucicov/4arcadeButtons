PImage img; 
import processing.sound.*; 
BandPass bandPass; 
SoundFile file;

void setup() {
  size (1200, 800);
  background (255);
  img = loadImage("podea.jpg");
  file = new SoundFile(this, "frigider.wav");
  file.play();
}

void draw() {
  image(img, 0, 0); 
  loadPixels();  
  color culoare=get(mouseX, mouseY);
  //println(brightness(culoare));
  file.amp(map(brightness(culoare), 0, 255, 0, 0.8));
  //bandPass = new BandPass(this);    //bandpass filter (passes frequencies within a certain range and rejects/attenuates frequencies outside that range)
  //if (brightness(culoare) < 200) {
  //  bandPass.process(file, map(brightness(culoare), 0, 255, 80, 18000));  //map->  re-maps a number from one range to another.
  //} else {
  //  bandPass.bw(20000);
  //}
}
