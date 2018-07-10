PImage img0_blue;
PImage img1_blue;

void create_blue0()
{
  img0_blue = createImage(img.width, img.height, RGB);
  for (int j=0; j < img.height; j++)
    {
      for (int i=0; i < img.width; i++)
        {
          int loc = i + j *img.width;
          //color o = img.pixels[loc];
          float r = blue(img.pixels[loc]);
          img0_blue.pixels[loc] = color(0, 0, r);
        }
    }
  img0_blue.save("pic0blue.png");
}

void create_blue1()
{
  img1_blue = createImage(img1.width, img1.height, RGB);
  for (int j=0; j < img1.height; j++)
    {
      for (int i=0; i < img1.width; i++)
        {
          int loc = i + j *img1.width;
          //color o = img.pixels[loc];
          float r = blue(img1.pixels[loc]);
          img1_blue.pixels[loc] = color(0, 0, r);
        }
    }
  img1_blue.save("pic1blue.png");
}
