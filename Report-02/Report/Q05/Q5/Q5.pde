PImage img, img_b, img_result;
boolean b[];
int labels[];
int threshold = 224;
boolean labeling_area_draw = true;
String path;
void loadImages(File selection)
{
    path = selection.getPath();

}
void setup() {
  size(1700, 450);
  path = "../extracted";
  selectFolder("写真のあるフォルダを選択してください","loadImages");
  changeImage(path + "/face0.png");
}
void draw() {
}
