import gab.opencv.*;



//写真から興味のある部分を取り出し、
//別々の画像ファイルとして保存する
//あるフォルダーの画像を順に表示し、処理を行う


//(1)実行の△をクリックする
//ここですべての画像を読み込むために少し待つ時間が生じる
//フォルダーに画像が多すぎると、コンピュータのメモリが足りない問題がある
//複数のフォルダーに分けましょう

//(2)画像フォルダを選択する、ここでは、順に進んで、最終的にman_dataを選ぶ
//(3)顔認識が自動的に実行される
//(4)顔認識できたとき、青と黄色の二つの枠が描かれる
//(5)顔認識が上手くできていないとき、青一つの枠が描く。

//(6)(4)の場合、人物から判断し、fキーあるいはmキーを押す。
//fキーを押した場合、女性のデータとして、fxxxのようなファイル名で
//顔抽出した画像を保存する
//mキーを押した場合、男性のデータとして、mxxxのようなファイル名で保存する

//(7)(５)の場合、手動で青い枠を移動、拡大縮小し、
//抽出したい顔の部分にあわせる
//具体的には、マウスクリックすることで、
//青い枠の位置を移動させる
//上矢印キーを押すと、青い枠が大きくなる
//下矢印キーを押すと、青い枠が小さくなる

//(8)手動で青い枠を顔に合わせて設定できたら、mキーあるいはfキーを押す
//すると、手動で選択した顔の画像が保存される


//(9)extracted フォルダーには、抽出された顔画像が保存される
//抽出された画像を細目に他のところに保存しましょう

//(10)次の画像に進みたいとき、右矢印キーを押す
//(１１)前の画像に戻りたいとき、左矢印キーを押す



import gab.opencv.*;
import java.awt.Rectangle;
//import processing.opengl.*;
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
//OpenCV opencv;

//int roiWidth = 112;
//int roiHeight = 112;

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
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
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
        //find_blob_hair();
        //find_blob_skin();

  
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
        rect(mface.x, mface.y, r, r);
    }
}
