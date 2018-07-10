import gab.opencv.*;

OpenCV opencv;
PImage img;
PImage gray;
PImage canny;

void setup(){
  size(1280,720);
  img = loadImage("DSC_0288.JPG");
  gray = createImage(img.width, img.height, RGB);
  img.filter(GRAY);
  
  opencv = new OpenCV(this, img);
  opencv.findCannyEdges(20,75);
  canny = opencv.getSnapshot();
}

void draw(){
  background(0, 0, 0);
  img.resize(640, 480);
  image(img, 0, 0, width/2, height/2);
  
  image(canny, 640, 360, width/2, height/2);
  
  save("pic1edge.jpg");
}
  
