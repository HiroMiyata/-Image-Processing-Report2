

void mousePressed()
{
  //useROI = true;
  actRandomSeed = (int) random(100000);
}


void mouseReleased()
{
  //useROI = false;
  //opencv.releaseROI();
}


// timestamp
String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
