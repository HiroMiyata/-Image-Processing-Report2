void changeImage(String imageName) {
  background(192);
  img = loadImage(imageName);
  img.resize(480, 320);
  image(img, 10, 50);
 
  bin_create();
  labeling_create();
  fill(0, 127, 255);
  text("← or → ",30,img.height + 100);
}
