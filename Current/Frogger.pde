int tile=50;
ArrayList<Lane> screen = new ArrayList<Lane>();
void setup() {
  
  frameRate(60);
  size(800, 900);
  
  
  colors = new color[]{#528148, #333F48, #277EBF};
  speed =.3;
  x = 7;
  y=17;
  generateLanes();
}
 
color[] colors;

boolean gameStarted = false;

float x;
float y;
float speed;
int score;
int highScore;
int high;
int score(){
  high = Math.max(score, high);
  return high;
}
void frog() {
  fill(100, 100, 100);
  rect(x*50+5, y*50+5, 40, 40);
}


void draw() {
  background(#528148);
  noStroke();

  //for (Lane l: screen) {
  //  if (y == l.y) {
  //    for (Obstacle o: l.row) {
  //      if (x == o.x) x += 2;
  //    }
  //  }
  //}

  if (gameStarted) y+=.3/50;
  for (int i = 0; i < screen.size(); i++) {
    color c = colors[screen.get(i).type];
    if (ison(x*50+5, y *50+5)==2) {
          x+= .1/(180);
   
    }
    else if(ison(x*50+5, y *50+5)==0){}
    else{
     
        reset();}
    
        
  
    if (gameStarted ) screen.get(i).y+=.3;
    if (screen.get(i).y> height) {
      screen.remove(i);
      screen.add(0, new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-50));
    }
screen.get(i).display(c);
    screen.get(i).car();
    //if(y*50 == screen.get(i).y){
    
   
    
}
    //if(screen.get(i).y+100> height){
    //  screen.add(0,new Lane((int) random(3), random(1), (int) random(13), i*tile-100));}
  
  frog();
  
  displayScore();
  
     
}

void displayScore() {
  PFont scoreFont = createFont("Arial", 32, true);
  textAlign(RIGHT, TOP);
  textFont(scoreFont);
  fill(255);
  int s = score;
  text("Score: " + s, 775, 40);
  if (s > highScore) highScore = s;
  text("High Score: " + highScore, 775, 80);
}

int  ison(float left, float y) {
    color c = get(int(left-.5), int(y+10));
    color v = get(int(left+40+1), int(y+10));
    if ((c ==#277EBF && v == #277EBF)) {
      //System.out.println("gameover");
      return 1;
    }
    else if(c==#000000 || v ==#000000){
    //System.out.println("gameover");
      return 1;}
    else if (c==#623322 || v ==#623322){
      return 2;}
    return 0;
  }
void reset(){
  for ( int i = 0; i< 18; i++) {
    screen.remove(0);
  }
  generateLanes();
  speed =.3;
  x = 7;
  this.y=17;
  gameStarted = false;
  score = 0;
  high = 0;
  
  
}

void generateLanes() {
   screen = new ArrayList<Lane>();
  for ( int i = 0; i< 19; i++) {
    screen.add(new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-50));
    
  }
  screen.add( new Lane(0, 0, 2, height-tile));
}
void keyPressed() {
  if (keyCode == LEFT || keyCode == 'A') {
    gameStarted = true;
    x--;
  }
  if (keyCode == RIGHT || keyCode == 'D') {
    gameStarted = true;
    x++;
  }
  if (keyCode == UP || keyCode == 'W' || keyCode == 'Q' || keyCode == 'E') {
    if (keyCode == 'Q') x--;
    if (keyCode == 'E') x++;
    gameStarted = true;
    y--;
    //y-=.4;
    // for (int i = 0; i < screen.size(); i++) {
    // screen.get(i).y+=30; 
     
    // }
    // y-=30/50;
    score++;
  }
  if (keyCode == DOWN || keyCode == 'S') {
    gameStarted = true;
    y++;
    score--;
  }
  
}
