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

boolean firstTry = true;
boolean gameStarted = false;
boolean gameOver = false;

//int curLane = 18;
float x;
float y;
float speed;
int score;
int lastHighScore;
int highScore;
int high;
int score(){
  high = Math.max(score, high);
  return high;
}

void frog() {
   // FROG's body
  smooth();
  ellipseMode(CENTER);
  noStroke();
  fill(0, 180, 60);
  ellipse(x * 50 + 25, y * 50 + 25, 25, 28);

  noStroke();
  fill(238, 205, 43);

  // FROG's leg left
  stroke(0, 180, 60);
  noFill();
  smooth();
  strokeWeight(3.5);
  strokeCap(ROUND);
  line(x * 50 + 20, y * 50 + 40, x * 50 + 8, y * 50 + 25);
  line(x * 50 + 15, y * 50 + 39, x * 50 + 8, y * 50 + 25);
  smooth();
  noStroke();
  fill(0, 180, 60);
  arc(x * 50 + 20, y * 50 + 42, 35, 8, PI, TWO_PI - PI / 2);

  // FROG's leg right
  stroke(0, 180, 60);
  noFill();
  smooth();
  strokeWeight(3.5);
  strokeCap(ROUND);
  line(x * 50 + 30, y * 50 + 40, x * 50 + 42, y * 50 + 25);
  line(x * 50 + 34, y * 50 + 39, x * 50 + 42, y * 50 + 25);
  smooth();
  noStroke();
  fill(0, 180, 60);
  arc(x * 50 + 30, y * 50 + 42, 35, 8, TWO_PI - PI / 2, TWO_PI);

  // FROG's face
  // FROG's mouth
  stroke(0, 100, 10);
  noFill();
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);
  line(x * 50 + 9, y * 50 + 25, x * 50 + 41, y * 50 + 25);

  // FROG's eye left
  smooth();
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x * 50 + 8, y * 50 + 17, 5, 5);
  fill(0);
  ellipse(x * 50 + 8, y * 50 + 17, 2, 2);

  // FROG's eye right
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x * 50 + 42, y * 50 + 17, 5, 5);
  fill(0);
  ellipse(x * 50 + 42, y * 50 + 17, 2, 2);
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

  if (gameStarted) y+=speed/50;
  for (int i = 0; i < screen.size(); i++) {
    color c = colors[screen.get(i).type];
    if (gameStarted){if (ison(x*50+5, y *50+5)==2) {
          //x+= .1/(180);
   
    }
    else if(ison(x*50+5, y *50+5)==0) {}
    else {
      gameStarted = false;
      gameOver = true;
      }
    }
    
    if(x*50 > width|| x*50 +50 < 0|| y *50>height){    
  gameStarted = false;
      gameOver = true;}
    if (gameStarted ) screen.get(i).y+=speed;
    if (screen.get(i).y> height+50) {
      screen.remove(i);
      screen.add(0, new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-50,random(.3)+.001));
      //curLane++;
    }
screen.get(i).display(c);
    screen.get(i).car();
    //if(y*50 == screen.get(i).y){
    
   
    
}
    //if(screen.get(i).y+100> height){
    //  screen.add(0,new Lane((int) random(3), random(1), (int) random(13), i*tile-100));}
  
  frog();
  
  if (firstTry) firstTry();
  else if (gameOver) gameOver();
  else displayScore();
  //speed=.3;
  
     
}

void displayScore() {
  PFont scoreFont = createFont("Arial", 32, true);
  textAlign(RIGHT, TOP);
  textFont(scoreFont);
  fill(255);
  int s = score();
  text("Score: " + s, 775, 40);
  if (s > highScore) highScore = s;
  text("High Score: " + highScore, 775, 80);
}

void firstTry() {
  PFont titleFont = createFont("Arial", 80, true);
  PFont textFont = createFont("Arial", 24, true);
  textAlign(CENTER, TOP);
  textFont(titleFont);
  fill(255);
  text("FROGGER", 400, 50);
  textFont(textFont);
  text("Dodge cars and cross rivers to make it as far as possible!", 400, 300);
  text("Use WASD or arrow keys to leap!", 400, 350);
  text("(Also try Q or E to leap diagonally, it may come in handy)", 400, 400);
  text("Press any key to start.", 400, 750);
}

void gameOver() {
  background(#528148);
  PFont GameOverFont = createFont("Arial", 80, true);
  PFont scoreFont = createFont("Arial", 64, true);
  PFont textFont = createFont("Arial", 24, true);
  textAlign(CENTER, TOP);
  fill(255);
  textFont(GameOverFont);
  text("GAME OVER!", 400, 50);
  textFont(scoreFont);
  text("Score: " + score(), 400, 150);
  textFont(textFont);
  if (score() > lastHighScore) {
    text("(new record!)", 400, 250);
  }
  text("Press any key to restart.", 400, 750);
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
    //  x +=  laneSpeedX / 50;
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
  score = 0;
  high = 0;
  //curLane = 18;
  
  
  
}

void generateLanes() {
   screen = new ArrayList<Lane>();
  for ( int i = 0; i< 20; i++) {
    screen.add(new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-50, random(.3)+.001));
    
  }
  screen.add( new Lane(0, 0, 2, height-tile,0));
}
void keyPressed() {
  firstTry = false;
  if (gameOver) {
    reset();
    gameOver = false;
    lastHighScore = highScore;
  } 
  else {
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
       //
      score++;
      //curLane--;
    }
    if (keyCode == DOWN || keyCode == 'S') {
      gameStarted = true;
      y++;
      score--;
      //curLane++;
    }
  }
  //System.out.println(curLane);
}
