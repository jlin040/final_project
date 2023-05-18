  int tile=50;
 ArrayList<Lane> screen = new ArrayList<Lane>();
void setup(){
  frameRate(30);
size(800,900);
  for( int i = 0; i< 23; i++){
     screen.add(new Lane((int) random(3),(float)( (random(3)+1)*Math.pow(-1,(int)random(2))), (int) random(13), i*tile-300));
     }
screen.add( new Lane(0,0,0,height-tile));
colors = new color[]{ color(0,0,0), color(255,255,255), color(255,0,0)};
}
color[] colors;
 
   
 




int speed;




void draw(){
  int n = 0;
  for(int i = 0; i < screen.size();i++){
    color c = colors[screen.get(i).type];
    fill(c);
    rect(0, screen.get(i).y,width,tile);
  screen.get(i).y+=.1;
if(screen.get(i).y> height){
  screen.remove(i);
  screen.add(0,new Lane((int) random(3), random(1), (int) random(13), i*tile-300));

}

  screen.get(i).car();

  
//if(screen.get(i).y+100> height){
//  screen.add(0,new Lane((int) random(3), random(1), (int) random(13), i*tile-100));}
}
 
    
}
