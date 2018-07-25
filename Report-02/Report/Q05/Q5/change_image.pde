void changeImage(String imageName) {
  background(192);
  img = loadImage(imageName);
  img.resize(480, 320);
  image(img, 10, 50);
  textSize(30);
  fill(255, 127, 0);
  text("[face"+imageNum+".jpg] OriginalData", 10, 30);
  bin_create();
  labeling_create();
  fill(0, 127, 255);
  text("← or → Change Image!",30,img.height + 100);
}
