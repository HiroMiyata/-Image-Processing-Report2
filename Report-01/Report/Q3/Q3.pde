import gab.opencv.*;

OpenCV opencv, opencv2, opencv3;
Histogram rHist, gHist, bHist;

PImage img;
PImage img2;
PImage img3;

void setup() {
  size(1080, 720);
  background(255,150,150);
  img = loadImage("pic0red.png");
  img2 = loadImage("pic0green.png");
  img3 = loadImage("pic0blue.png");
  opencv = new OpenCV(this, img);
  opencv2 = new OpenCV(this, img2);
  opencv3 = new OpenCV(this, img3);

  rHist = opencv.findHistogram(opencv.getR(), 256);
  gHist = opencv.findHistogram(opencv2.getG(), 256);
  bHist = opencv.findHistogram(opencv3.getB(), 256);
}

void draw(){
  image(img, 10, 200, 300, 200);
  image(img2, 330, 200, 300, 200);
  image(img3, 650, 200, 300, 200);

  stroke(0, 0, 0); noFill();  
  rect(10, height - 300, 300, 270);
  
  fill(255, 255, 255); noStroke();
  rHist.draw(10, height - 300, 300, 270);
  
  stroke(0, 0, 0); noFill();  
  rect(330, height - 300, 300, 270);
  
  fill(255, 255, 0); noStroke();
  gHist.draw(330, height - 300, 300, 270);
  
  stroke(0, 0, 0); noFill();  
  rect(650, height - 300, 300, 270);
  
  fill(160, 216, 239); noStroke();
  bHist.draw(650, height - 300, 300, 270);
  
  save("find_hist.jpg");
}


