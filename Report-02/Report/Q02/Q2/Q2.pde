import gab.opencv.*;





import gab.opencv.*;
import java.awt.Rectangle;
import processing.pdf.*;
import java.util.Calendar;
import processing.video.*;


OpenCV opencv;


int t_key_pressed;
int f_key_pressed;
int m_key_pressed;

int r;
PVector mface;



int indexOfImage = 0;
ArrayList<PImage> originalImages = new ArrayList<PImage>();
ArrayList<PImage> mosaicImages = new ArrayList<PImage>();
String[] extensions = {
    ".jpg",".gif",".tga",".png"
};



Rectangle[] faces;


float my_timer;
int savePDF = 0; 
int actRandomSeed;
int saveFrame_sign = 0;

PImage src;


boolean useROI = false;

//////////////////////////////////////////////

void loadImages(File selection)
{
    File[] files = selection.listFiles();
    for(int i = 0; i < files.length; i++)
    {
        for(String extension : extensions)
        {
            if(files[i].getPath().endsWith(extension))
            {
                PImage originalImage = loadImage(files[i].getAbsolutePath());

                originalImages.add(originalImage);
            }
        }
    }
    
    if(!originalImages.isEmpty()){
        PImage img = originalImages.get(0);
        
        mface = new PVector(img.width/2.0, img.height/2.0, 0);
        src = img.get();
    }
}



void find_face()
{
  PImage img = originalImages.get(indexOfImage);

  opencv = new OpenCV(this, img);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
        
  noFill();
  stroke(255, 255, 0);
  strokeWeight(3);
 for (int i = 0; i < faces.length; i++) {
  }
}





void setup() 
{
  size(1080, 720);
  
  selectFolder("写真のあるフォルダを選択してください","loadImages");
  
  t_key_pressed = 0;
  f_key_pressed = 0;
  m_key_pressed = 0;
  
  r = 40;
  mface = new PVector(0, 0, 0);
}





void draw() 
{
    if(!originalImages.isEmpty())
    {
        image(originalImages.get(indexOfImage), 0, 0);
        find_face();

        if(faces.length != 0)
        {
          mface = new PVector(faces[0].x-2, faces[0].y-2, 0);
          r = int((faces[0].width + faces[0].height)/2.0)+4; 
        }

        //move face rect
        if(mousePressed)
        {
          mface = new PVector(mouseX, mouseY, 0);

        }
        
        opencv.setROI((int)mface.x, (int)mface.y, r, r);
        
        //save famale data
        if(f_key_pressed == 1)
        {
          save_face_to_file() ;
          f_key_pressed = 0;
          //useROI = false;
          opencv.releaseROI();
        }
        
        //save man data
        if(m_key_pressed == 1)
        {
          save_face_to_file() ;
          m_key_pressed = 0;
          //useROI = false;
          opencv.releaseROI();
        }
        
        
        stroke(0, 255, 255);
        strokeWeight(2.0);
        
    }
}
