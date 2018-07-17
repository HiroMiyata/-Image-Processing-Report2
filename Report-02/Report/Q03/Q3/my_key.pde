

void keyPressed(){
  
   if(keyCode == UP){
       r += 5;
   }
   else if(keyCode == DOWN){
       if(r > 0){
           r -= 5;
       }
   }else if(keyCode == RIGHT){
     background(0);
       indexOfImage = (indexOfImage+1)%originalImages.size();
       PImage img = originalImages.get(indexOfImage);
   }else if(keyCode == LEFT){
     background(0);
     
       indexOfImage--;
       if(indexOfImage < 0){
           indexOfImage += originalImages.size();
       }
       indexOfImage = (indexOfImage)%originalImages.size();
       PImage img = originalImages.get(indexOfImage);
   }
  else if ( key == 's'|| key == 'S' ) {
    PImage img = originalImages.get(indexOfImage);
    img.save(indexOfImage +".png" );
  }
  else if ( key == 't' || key == 'T' ) t_key_pressed = 1;
  else if (key == 'f' || key == 'F') f_key_pressed = 1;
  else if (key == 'm' || key == 'M') m_key_pressed = 1;
}
