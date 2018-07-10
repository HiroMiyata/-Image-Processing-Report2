import gab.opencv.*;

OpenCV opencv;
PImage  img, img2, pic0pic1diff, area;

void setup() {
  size(1280, 960);
  img = loadImage("DSC_0286.JPG");
  img2 = loadImage("DSC_0288.JPG");

  opencv = new OpenCV(this, img);    
  opencv.diff(img2);
  pic0pic1diff = opencv.getSnapshot(); 
 
}

void draw() {
  pushMatrix();
  img.resize(640, 480);
  img2.resize(640, 480);
  pic0pic1diff.resize(640, 480);
  textSize(50);
  image(img, 0, 0);
  image(img2, img.width, 0);
  image(pic0pic1diff, img.width, img.height);
  popMatrix();
  pic0pic1diff.save("graydiff.jpg");
  save("pic0pic1diff.jpg");
}

