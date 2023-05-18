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
      row = new ArrayList<Obstacle>();
  
      for( int i = 0; i < numob; i++){
        row.add(new Obstacle(width-(i * (width/numob)), false, false));
      }
      for( int i = 0; i < numob; i++){
        fill(0,255,0);
        rect(row.get(i).x+speed, y, 30, tile);
        speed+=lanespeedX*.3;
        if(row.get(i).x+speed-100>width){
          row.remove(i);
        row.add(new Obstacle(width-(i * (width/numob)), false, false))
        ;
        
      }
        
        
        
      }}
      
   
  }
  
}
