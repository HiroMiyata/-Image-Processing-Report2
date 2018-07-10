PImage img0_red;
PImage img1_red;

void create_red0()
{
  img0_red = createImage(img.width, img.height, RGB);
  for (int j=0; j < img.height; j++)
    {
      for (int i=0; i < img.width; i++)
        {
          int loc = i + j *img.width;
          //color o = img.pixels[loc];
          float r = red(img.pixels[loc]);
          img0_red.pixels[loc] = color(r, 0, 0);
        }
    }
  img0_red.save("pic0red.png");
}

void create_red1()
{
  img1_red = createImage(img1.width, img1.height, RGB);
  for (int j=0; j < img1.height; j++)
    {
      for (int i=0; i < img1.width; i++)
        {
          int loc = i + j *img1.width;
          //color o = img.pixels[loc];
          float r = red(img1.pixels[loc]);
          img1_red.pixels[loc] = color(r, 0, 0);
        }
    }
  img1_red.save("pic1red.png");
}
