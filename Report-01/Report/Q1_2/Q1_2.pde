PImage img;
PImage img1;

void setup(){
  size(1280,720);
  img = loadImage("DSC_0286.JPG");
  img1 = loadImage("DSC_0288.JPG");
  
}

void draw(){
  background(0, 0, 0);
  img.resize(640, 480);
  img1.resize(640, 480);
  
  create_red0();
  create_red1();
  
  create_green0();
  create_green1();
  
  create_blue0();
  create_blue1();
  
  image(img0_red, 10, 10, width/3, height/3);
  image(img0_green, width/3 + 20, 10, width/3, height/3);
  image(img0_blue, 2*width/3 + 30, 10, width/3, height/3);
  image(img1_red, 10, height/3 + 20, width/3, height/3);
  image(img1_green, width/3 + 20, height/3 + 20, width/3, height/3);
  image(img1_blue, 2*width/3 + 30, height/3 + 20, width/3, height/3);
  
  save("Change_color.jpg");
  
}
  
