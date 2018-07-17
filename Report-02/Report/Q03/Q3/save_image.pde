
void save_face_to_file(String sss) 
{

    
    
    if (f_key_pressed == 1) 
    {
      sss = "extracted/F"+ timestamp() + ".png";
    }
    else if (m_key_pressed == 1)
    {
       sss = "extracted/M"+ timestamp() + ".png";
    }
    

    //PImage newImage = createImage(roiWidth, roiHeight,RGB);
    
    PImage newImage = createImage(int(r), int(r), RGB);
    newImage = opencv.getSnapshot();
    
    if (f_key_pressed == 1 || m_key_pressed == 1)
    {
      newImage.save(sss);
      f_key_pressed = 0;
      m_key_pressed = 0;
    }

    image(newImage, width-r,0);
    stroke(0, 255, 0);
    rect(width-r, 0, r, r);
    
 // }
}
