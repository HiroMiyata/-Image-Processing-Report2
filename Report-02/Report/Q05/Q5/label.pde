int labels_check[]; //<>//
void labeling_create() {
  
  labels = new int[img.width*img.height];
  //黒の時
  if (b[0]) {
    labels[0] = label;
  }

  //TopLine
  
  top_line();

  //AllLine(1行目を除く)
  
  all_line();
  if (labeling_color_draw) {
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
  } else {
    image(img_b, img.width*2+50, 50);
  }
  labels_check = labels;
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
