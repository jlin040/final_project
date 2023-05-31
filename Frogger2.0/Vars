/* @pjs preload = "avatar.png"; */
//declaring width and height
int width = 1366;
int height = 627;
//answer for prompt
int answer;
int score = -1;
int minY = Infinity;
boolean playing = true;
// ifWon is making the keys not work
boolean ifWon = false;
boolean stop = false;
//loading images
int avatar = loadImage("avatar.png");
//int frame = loadImage("colo.png");
int answer;
//x & y pos of character
guyX = (width/2)-(width/54.43);
guyY = height-(height/9);
//width and height of logs and cars
int logWidth = random(100,120);
int logHeight = 50;
int grassHeight = height/9;
int largeHeight = height/3;
int carWidth = 70; 
int carHeight = 30;
// Arrays for cars and logs
int [] topCars = new int [floor(width/300)];
int [] middleCars = new int [floor(width/300)];
int [] bottomCars = new int [floor(width/300)];
int [] topLogs = new int [floor(width/300)];
int [] middleLogs = new int [floor(width/300)];
int [] bottomLogs = new int [floor(width/300)];
int [] yCoord = [];
//randomizing speeds of cars and logs
int topCarSpeed = random(1, 2);
int middleCarSpeed = random(1, 2);
int bottomCarSpeed = random(1, 2);
int topLogSpeed = random(1, 2);
int middleLogSpeed = random(1, 2);
int bottomLogSpeed = random(1, 2);
//setting if on the log to false
boolean onLog = false;
//colors for cars (randomized)
color [] topColor = new color [floor(width/300)];
color [] middleColor = new color [floor(width/300)];
color [] bottomColor = new color [floor(width/300)];
//difficulty of level
int difficulty = 5;
//setting life to 3
int life = 3;
//setting score to -1 because it adds 1 at start
int score = 0;
// int minY = Infinity;
//if game end, cannot move keys
boolean gameEnd = false;
//side moving of keys
int click  = width/30;
//setting level to 1
int level = 1;
boolean lostGame = false;
boolean wonLevel = false;
int tx = guyX;
int ty = guyY;
