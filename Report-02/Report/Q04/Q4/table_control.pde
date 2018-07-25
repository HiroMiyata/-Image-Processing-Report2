void tableChange(int changeInt, int min) {
  for (int i = 0; i < img.width*img.height; i++) {
    if (labels[i] == changeInt) {
      labels[i] = min;
    }
  }
}
int tableArea(int label) {
  int area = 0;
  for (int i = 0; i < img.width*img.height; i++) {
    if (labels[i] == label) {
      area++;
    }
  }
  return area;
}

void textTableChange(int changeInt) {
  for (int i = 0; i < img.width*img.height; i++) {
    if (labels[i] == changeInt) {
      labels_check[i] = 99999;
    }
  }
}
