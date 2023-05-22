int tile=50;
ArrayList<Lane> screen = new ArrayList<Lane>();
void setup() {
  frameRate(30);
  size(800, 900);
  for ( int i = 0; i< 23; i++) {
    screen.add(new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-300));
  }
  screen.add( new Lane(0, 0, 0, height-tile));
  colors = new color[]{ color(0, 0, 0), color(255, 255, 255), color(255, 0, 0)};
  speed =.3;
  x = 7;
  y=17;
}
color[] colors;

boolean gameStarted = false;

float x;
float y;
float speed;

void frog() {
  fill(100, 100, 100);
  rect(x*50+5, y*50+5, 40, 40);
}


void draw() {

  for (int i = 0; i < screen.size(); i++) {
    color c = colors[screen.get(i).type];
    fill(c);
    rect(0, screen.get(i).y, width, tile);
    if (gameStarted ) screen.get(i).y+=.9;
    if (screen.get(i).y> height) {
      screen.remove(i);
      screen.add(0, new Lane((int) random(3), (float)( (random(3)+1)*Math.pow(-1, (int)random(2))), (int) constrain(random(8), 3, 4), i*tile-200));
    }

    screen.get(i).car();
    if(y*40>=screen.get(i).y&& y*40 <= screen.get(i).y + tile){
    if (screen.get(i).ison(x*40, y *40)) {
      System.out.println("on");
    }}


    //if(screen.get(i).y+100> height){
    //  screen.add(0,new Lane((int) random(3), random(1), (int) random(13), i*tile-100));}
  }
  if (gameStarted) y+=(.9/50);
  //for (Lane l: screen) {
  //  if (y == l.y) {
  //    for (Obstacle o: l.row) {
  //      if (x == o.x) x += 2;
  //    }
  //  }
  //}
  frog();
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
  if (keyCode == UP || keyCode == 'W') {
    gameStarted = true;
    y--;
  }
  if (keyCode == DOWN || keyCode == 'S') {
    gameStarted = true;
    y++;
  }
}
