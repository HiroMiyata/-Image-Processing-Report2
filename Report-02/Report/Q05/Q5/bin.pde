void bin_create() {
  img_b = new PImage(img.width, img.height);
  b = new boolean[img.width*img.height];
  float allBright = 0;
  for (int j = 0; j < img.width*img.height; j++) {
    color pixel_color = img.pixels[j];
    allBright +=brightness(pixel_color);
  }
  threshold =(int)allBright/ (img.width*img.height);
  for (int i = 0; i <img.width*img.height; i++) {
    color pixel_color = img.pixels[i];
    float luminance_color =brightness(pixel_color);
    if (luminance_color > threshold) {
      b[i] = false;
      img_b.pixels[i] = color(255);
    } else {
      b[i] = true;
      img_b.pixels[i] = color(0);
    }
  }
  image(img_b, img.width+30, 50);
  textSize(30);
  fill(255, 127, 0);
  text("[face"+imageNum+".jpg] BinarizationData", img.width+30, 30);
}
