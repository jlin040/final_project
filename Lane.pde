class Lane{
  Lane(int t, float s, int num, float y){
    type = t;
    lanespeedX = s;
    numob = num;
    this.y = y;
  }
  Lane(int t){
    type = t;}
  ArrayList<Obstacle> row;
  float y;
  int numob;
  float lanespeedX;
  int type;// 0 for nothing, 1 for cars, 2 for logs ( maybe implement trains, lily pads)
  float speed;
  
  
  void car(){
    if(type == 1){
      int maxw = width/numob;
      
      
      for(int i=-2; i < numob;i++){
        fill(0,255,0);
        rect(i*maxw+lanespeedX,y,30,50);
        lanespeedX+=.1;
        if(lanespeedX>=maxw)
        lanespeedX=0;
        
        
     
      }
      
    }
      
   
  }

}
