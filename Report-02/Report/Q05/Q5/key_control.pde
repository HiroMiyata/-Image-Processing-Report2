int imageNum = 0;
int NUMMAX = 11;
void keyPressed() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    if (keyCode == LEFT) {
      if (imageNum == 0) {
        imageNum = NUMMAX;
      } else {
        imageNum--;
      }
    } else if (keyCode == RIGHT) {
      if (imageNum == NUMMAX) {
        imageNum = 0;
      } else {
        imageNum++;
      }
    }
    changeImage("../data/face"+imageNum+".jpg");
  }
}
