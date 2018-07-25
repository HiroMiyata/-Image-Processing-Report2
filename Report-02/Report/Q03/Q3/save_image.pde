
void save_face_to_file(String sss) 
{

    
    
    if (f_key_pressed == 1) 
    {
      sss = "extracted/"+sss + ".png";
    }
    
    

    //PImage newImage = createImage(roiWidth, roiHeight,RGB);
    
    PImage newImage = createImage(int(r), int(r), RGB);
    for (int i = 0; i < faces.length; i++) {
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      newImage = opencv.getInput().get(faces[i].x, faces[i].y, faces[i].width, faces[i].height);//画像の切り取り
    }  
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
