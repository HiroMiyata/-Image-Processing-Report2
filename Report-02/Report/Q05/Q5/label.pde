int labels_check[]; //<>//
void labeling_create() {
  int label = 0;
  labels = new int[img.width*img.height];
  //黒の時
  if (b[0]) {
    labels[0] = label;
  }

  //TopLine
  for (int i = 1; i<img.width; i++) {
    //黒の時
    if (b[i]) {
      //1pixel前が白
      if (!b[i-1]) {
        labels[i] = ++label;//新規ラベル
      } else {
        labels[i] = labels[i-1];//ラベル継続
      }
    }
  }

  //AllLine(1行目を除く)
  for (int y = 1; y<img.height; y++) {
    for (int x = 0; x<img.width; x++) {
      int p_point = x + y * img.width;
      boolean leftUp =false;
      boolean up = false;
      boolean rightUp = false;
      //黒の時
      if (b[p_point]) {
        //周囲8方向のpixel範囲1が白(左上,上,右上,左でよい)
        if (x != 0 && x != img.width-1) {
          if (!b[p_point-1] && !b[p_point-img.width-1] && !b[p_point-img.width] && !b[p_point-img.width+1]) {
            labels[p_point] = ++label;//新規ラベル
          } else {  
            labels[p_point] = 65535;
            if (b[p_point-img.width-1]) {  
              // 左上のラベル継続
              leftUp = true;
              labels[p_point] = labels[p_point-img.width-1];
            }
            if (b[p_point-img.width]) { 
              // 上のラベル継続
              up = true;      
              if (labels[p_point] > labels[p_point-img.width]) {
                labels[p_point] = labels[p_point-img.width];
                if (leftUp) {
                  tableChange(labels[p_point-img.width-1], labels[p_point]);
                }
              }
            }
          } 
          if (b[p_point-img.width+1]) { 
            // 右上のラベル継続
            rightUp = true;
            if (labels[p_point] > labels[p_point-img.width+1]) {
              labels[p_point] = labels[p_point-img.width+1];
              if (leftUp) {
                tableChange(labels[p_point-img.width-1], labels[p_point]);
              }              
              if (up) {
                tableChange(labels[p_point-img.width], labels[p_point]);
              }
            }
          } 
          if (b[p_point-1]) {
            // 左のラベル継続
            if (labels[p_point] > labels[p_point-1]) {
              labels[p_point]= labels[p_point-1];

              if (leftUp) {
                tableChange(labels[p_point-img.width-1], labels[p_point]);
              }
              if (up) {
                tableChange(labels[p_point-img.width], labels[p_point]);
              }              
              if (rightUp) {
                tableChange(labels[p_point-img.width+1], labels[p_point]);
              }
            }
          }
        } else if (x == 0) {
          if (!b[p_point-img.width] && !b[p_point-img.width+1]) {
            labels[p_point] = ++label;//新規ラベル
          } else {  
            labels[p_point] = 65535;
            if (b[p_point-img.width]) { 
              // 上のラベル継続
              up = true;      
              if (labels[p_point] > labels[p_point-img.width]) {
                labels[p_point] = labels[p_point-img.width];
              }
            }
          } 
          if (b[p_point-img.width+1]) { 
            // 右上のラベル継続
            rightUp = true;
            if (labels[p_point] > labels[p_point-img.width+1]) {
              labels[p_point] = labels[p_point-img.width+1];         
              if (up) {
                tableChange(labels[p_point-img.width], labels[p_point]);
              }
            }
          }
        } else {
          if (!b[p_point-1] && !b[p_point-img.width-1] && !b[p_point-img.width]) {
            labels[p_point] = ++label;//新規ラベル
          } else {  
            labels[p_point] = 65535;
            if (b[p_point-img.width-1]) {  
              // 左上のラベル継続
              leftUp = true;
              labels[p_point] = labels[p_point-img.width-1];
            }
            if (b[p_point-img.width]) { 
              // 上のラベル継続
              up = true;      
              if (labels[p_point] > labels[p_point-img.width]) {
                labels[p_point] = labels[p_point-img.width];
                if (leftUp) {
                  tableChange(labels[p_point-img.width-1], labels[p_point]);
                }
              }
            }
          } 

          if (b[p_point-1]) {
            // 左のラベル継続
            if (labels[p_point] > labels[p_point-1]) {
              labels[p_point]= labels[p_point-1];

              if (leftUp) {
                tableChange(labels[p_point-img.width-1], labels[p_point]);
              }
              if (up) {
                tableChange(labels[p_point-img.width], labels[p_point]);
              }
            }
          }
        }
      }
    }
  }
  int labelSize = labels.length;  
  int randomRGB[][] = new int[labelSize][3]; 
  for (int i = 0; i < labelSize; i++) {
    randomRGB[i][0] = (int)random(255);
    randomRGB[i][1] = (int)random(255);
    randomRGB[i][2] = (int)random(255);
  }
  img_result = new PImage(img.width, img.height);
  //色塗り
  for (int y = 0; y<img.height; y++) {
    for (int x = 0; x<img.width; x++) {
      int p_point = x + y * img.width;

      if (b[p_point]) {
        img_result.pixels[p_point] = color(randomRGB[labels[p_point]][0], randomRGB[labels[p_point]][1], randomRGB[labels[p_point]][2]);
      } else {
        img_result.pixels[p_point] = color(255, 255, 255);
      }
    }
  }
  image(img_result, img.width*2+50, 50);

  labels_check = labels;
  if (labeling_area_draw) {
    //テキスト出力
    for (int y = 0; y<img.height; y++) {
      for (int x = 0; x<img.width; x++) {
        int p_point = x + y * img.width;
        if (labels_check[p_point] != 99999) {
          if (tableArea(labels_check[p_point]) > 50) {
            fill(0, 0, 255);
            textSize(15);
            text("Label:"+labels_check[p_point]+" Area:"+tableArea(labels_check[p_point])+"px", img.width*2+50+x, y+70);
          }
          textTableChange(labels_check[p_point]);
        }
      }
    }
  }
  textSize(30);
  fill(255, 127, 0);
  text("[face"+imageNum+".jpg] LabelingData", img.width*2+50, 30);
}
