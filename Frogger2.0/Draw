void draw() {
	// yCoord.push(ty);
	// if(min(yCoord)<minY){
	// 	minY = min(yCoord);
	// 	score++;
	// }
	//if you hit the space bar pause and play music
	if(keyCode == 32) {
		if (playing) {
			music.pause();
			playing = false;
		} 
		else {
			music.play();
			playing = true;
		}
		keyCode = 0;
	}
	noStroke();
	// if (guyX < width/2){
	// 	text("You LOST", height/2, width/2);
	// }
	
	background(255,255,255);
	//draws grass
	drawGrass();
	
	textSize(40);
	fill(0,0,0);
	
	

	//road
	fill(105,105,105);
	rect(0, 2 * grassHeight + largeHeight, width, largeHeight);
	
	//water
	fill(30,144,255);
	rect(0, grassHeight, width, largeHeight);
	

	//road lines
	for (int i = 0; i < width; i = i + 40) {
		stroke (255,255,255);
		line (i, 1.38 * largeHeight + 1.88 * grassHeight, i + 25, 1.38* largeHeight + grassHeight*1.88);
		line (i, 1.62 * largeHeight + 2.12 * grassHeight, i + 25, 1.62 * largeHeight + grassHeight*2.12);
	}
	
	theLogs();
	
	addCar();
	
		
	doCars();
	textSize(20);
	fill(0,0,0);
	text("Level: " + level, 60, height/17*16);
	
	nextLevel();
	
	textSize(20);
	text("Life: " + life, width-50, height/20);
	
	text("Score: " + score, 60, height/20);

	text("Click space bar to pause/play music", width/6*5, height/17*16);
	
	guyX = lerp(guyX, tx, 0.6);
	guyY = lerp(guyY, ty, 0.6);
	
	image(avatar, guyX, guyY, 50, 50);
	
	youLose();
	//image(frame, -100, -100, window.innerWidth, window.innerHeight);
}

//drawing grass
void drawGrass(){
	//bottom grass
	fill (50,205,50);
	rect(0, 2 * grassHeight + 2 * largeHeight, width, grassHeight);
	//middle grass
	rect(0, grassHeight + largeHeight, width, grassHeight);
	//top grass
	rect(0, 0, width, grassHeight);
}
