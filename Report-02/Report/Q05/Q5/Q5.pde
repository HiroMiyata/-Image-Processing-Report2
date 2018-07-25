PImage img, img_b, img_result;
boolean b[];
int labels[];
int threshold = 224;//とりあえずの値
boolean labeling_area_draw = true;//連結成分の面積を表示するかどうか
void setup() {
  size(1700, 450);
  changeImage("../data/face0.jpg");
}
void draw() {
}
