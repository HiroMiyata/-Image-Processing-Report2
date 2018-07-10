PImage img;
int area = 0;

void setup(){
  size(1280,720);
  img = loadImage("graydiff.jpg");
}

void draw(){
  img.resize(640, 480);
  textSize(50);
  image(img, 0, 0);
  
  area = areadiff();
  fill(255);
  text("S(x) = " + area + " ", 10, 550);
  save("diffarea.jpg");
}

int areadiff(){
  int count=0;
  for (int j=0; j < img.height; j++)
    {
      for (int i=0; i < img.width; i++)
        {
          int loc = i + j *img.width;
          color c = img.pixels[loc];
          float a = brightness(c);
          
          if(a>0) count++;
        }
    }
    return count;
}
