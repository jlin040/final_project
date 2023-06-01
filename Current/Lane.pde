class Lane {
  
  //Lane(int t) {
  //  type = t;
  //}
  float[] xcoords;
  float y;

  int numob;
  int maxw;
  float w;
  float lanespeedX;
  int type;// 0 for nothing, 1 for cars, 2 for logs ( maybe implement trains, lily pads)
  float speed;
  //color[] colors;
  //color[] obColors;
  
  Lane(int t, float s, int num, float y) {
  type = t;
  lanespeedX = s;
  numob = num;
  this.y = y;
  w=constrain(random(width)/numob, 60, 70);
  xcoords = new float[numob];
  for (int i = 0; i < numob; i++) {
    xcoords[i] = i*maxw+lanespeedX;
  }
  //int maxw = width/numob;
  //for (int i = -1; i < numob; i++) {
  //  fill(obColors[type - 1]);
  //  rect(i*maxw+lanespeedX, y, w, 50);
    //colors = new color[]{#528148, #333F48, #277EBF};
    //obColors = new color[]{#000000, #623322};
  }
  
  void display(color c) {
    fill(c);
    rect(0, y, 800, 50);
  }
  
  void placeObstacles() {
  
  }


  void car() {

    if (type == 1) {
      int maxw = width/numob;

      if (lanespeedX>0) {
        for (int i=-2; i < numob; i++) {

          fill(0, 0, 0);
          rect(i*maxw+lanespeedX, y+5, w, 40);
          if (lanespeedX>0) {
            lanespeedX+=.1;
            if (Math.abs(lanespeedX)>=maxw)
              lanespeedX=.0000001;
          }
        }
      }
      if (lanespeedX<0) {
        for (int i=0; i < numob+2; i++) {
          fill(0, 0, 0);
          rect(i*maxw+lanespeedX, y+5, w, 40);
          lanespeedX-=.1;
          if (Math.abs(lanespeedX)>=maxw)
            lanespeedX=-.000001;
        }
      }
    }
    if (type == 2) {
      int maxw = width/numob;


      for (int i=-2; i < numob; i++) {
        fill(#623322);
        rect(i*maxw+lanespeedX, y+5, 90, 40);

        lanespeedX+=.1;
        if (lanespeedX>=maxw)
          lanespeedX=0;
      }
    }
  }
  
}
