PImage img0_green;
PImage img1_green;

void create_green0()
{
  img0_green = createImage(img.width, img.height, RGB);
  for (int j=0; j < img.height; j++)
    {
      for (int i=0; i < img.width; i++)
        {
          int loc = i + j *img.width;
          //color o = img.pixels[loc];
          float r = green(img.pixels[loc]);
          img0_green.pixels[loc] = color(0, r, 0);
        }
    }
  img0_green.save("pic0green.png");
}

void create_green1()
{
  img1_green = createImage(img1.width, img1.height, RGB);
  for (int j=0; j < img1.height; j++)
    {
      for (int i=0; i < img1.width; i++)
        {
          int loc = i + j *img1.width;
          //color o = img.pixels[loc];
          float r = green(img1.pixels[loc]);
          img1_green.pixels[loc] = color(0, r, 0);
        }
    }
  img1_green.save("pic1green.png");
}
