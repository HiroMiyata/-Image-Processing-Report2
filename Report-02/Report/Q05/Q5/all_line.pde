void all_line(){
  for (int y = 1; y<img.height; y++) {
    for (int x = 0; x<img.width; x++) {
      int p_point = x + y * img.width;
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
}
