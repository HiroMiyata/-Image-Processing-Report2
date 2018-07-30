PImage img, img_b, img_result;
boolean b[];
int labels[];
int threshold = 224;
boolean labeling_color_draw = true;
String path;
int label = 0;
int p_point;
boolean leftUp =false;
boolean up = false;
boolean rightUp = false;
void loadImages(File selection)
{
    path = selection.getPath();

}
void setup() {
  size(1700, 600);
  path = "../extracted";
  selectFolder("写真のあるフォルダを選択してください","loadImages");
  changeImage(path + "/face0.png");
}
void draw() {
}
