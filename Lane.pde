class Lane {
  Lane(int t, float s, int num, float y) {
    type = t;
    lanespeedX = s;
    numob = num;
    this.y = y;
    w=constrain(random(width)/numob, 60, 90);
  }
  Lane(int t) {
    type = t;
  }
  ArrayList<Obstacle> row;
  float y;

  int numob;
  float w;
  float lanespeedX;
  int type;// 0 for nothing, 1 for cars, 2 for logs ( maybe implement trains, lily pads)
  float speed;


  void car() {

    if (type == 1) {
      int maxw = width/numob;

      if (lanespeedX>0) {
        for (int i=-2; i < numob; i++) {

          fill(0, 0, 0);
          rect(i*maxw+lanespeedX, y, w, 50);
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
          rect(i*maxw+lanespeedX, y, w, 50);
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
        rect(i*maxw+lanespeedX, y, w, 50);

        lanespeedX+=.1;
        if (lanespeedX>=maxw)
          lanespeedX=0;
      }
    }
  }
  boolean ison(float left, float y) {
    color c = get(int(left-1), int(y+10));
    color v = get(int(left+1+w), int(y+10));
    if ((c ==#277EBF && v == #277EBF) ||(c==#000000 || v ==#000000)) {
      System.out.println("gameover");
      return false;
    }
    return true;
  }
}
