void top_line(){
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
}
