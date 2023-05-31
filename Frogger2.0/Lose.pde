void nextLevel() {
	// if the guyY is in the top grass, go to the next level
	if (ty < 30){
		stop = true;
		textSize(40);
		//text in screen
		text("Click for Level " + (level+1) + ".", width/2, height/2);
		// if (!wonLevel) {
		// 	win.play();
		// 	wonLevel = true;
		// }
		if(mousePressed){
			stop = false;
			//go to the start, add a level, randomize the location of cars and logs, make speeds higher, reset life to 3
			tx = (width/2)-25;
			ty = height-70;	
			logWidth = random(100,120);
			level++;
			difficulty++;
			wonLevel = false;
			topCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			middleCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			bottomCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			topLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			middleLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			bottomLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			life = 3;
			for (int i = 0; i < topCars.length; i++) {
				topCars[i] = width*i/topCars.length + random(-width/12, width/12);
				topColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}

			for (int i = 0; i < middleCars.length; i++) {
				middleCars[i] = width*i/middleCars.length + random(-width/12, width/12);
				middleColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}

			for (int i = 0; i < bottomCars.length; i++) {
				bottomCars[i] = width*i/bottomCars.length + random(-width/12, width/12);
				bottomColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}
			for (int i = 0; i < topLogs.length; i++) {
				topLogs[i] = width*i/topLogs.length + random(-100, 100);
			}

			for (int i = 0; i < middleLogs.length; i++) {
				middleLogs[i] = width*i/middleLogs.length + random(-100, 100);
			}

			for (int i = 0; i < bottomLogs.length; i++) {
				bottomLogs[i] = width*i/bottomLogs.length + random(-100, 100);
			}
		}
	}
}

void youLose() {
	//if you have 0 lives
	if (life == 0) {
		stop = true;
		textSize(40);
		//display you lose
		if(level >= 8){
			text("Nice Try! You were on level " + level + ". Click to play again.", width/2, height/2);
		}
		else{
			text("Aw, Snap! Click to play again.",  width/2, height/2);
		}
		if (!lostGame) {
			lostGame = true;
		}
		gameEnd = true;
		if (mousePressed) {
			stop = false;
			score = 0;
			logWidth = random(100,120);
			for (int i = 0; i < topCars.length - 4; i++) {
				topCars.splice(0, 1);
				topColor.splice(0, 1);
			}
			for (int i = 0; i < middleCars.length - 4; i++) {
				middleCars.splice(0, 1);
				middleColor.splice(0, 1);
			}
			for (int i = 0; i < bottomCars.length - 4; i++) {
				bottomCars.splice(0, 1);
				bottomColor.splice(0, 1);
			}
			life = 3;
			gameEnd = false;
			level = 1;
			//reseting difficulty
			difficulty = 5;
			topCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			middleCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			bottomCarSpeed = random(0.25*difficulty, 0.5*difficulty);
			topLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			middleLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			bottomLogSpeed = random(0.25*difficulty, 0.5*difficulty);
			for (int i = 0; i < topCars.length; i++) {
				topCars[i] = width*i/topCars.length + random(-width/12, width/12);
				topColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}

			for (int i = 0; i < middleCars.length; i++) {
				middleCars[i] = width*i/middleCars.length + random(-width/12, width/12);
				middleColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}

			for (int i = 0; i < bottomCars.length; i++) {
				bottomCars[i] = width*i/bottomCars.length + random(-width/12, width/12);
				bottomColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
			}
			for (int i = 0; i < topLogs.length; i++) {
				topLogs[i] = width*i/topLogs.length + random(-100, 100);
			}

			for (int i = 0; i < middleLogs.length; i++) {
				middleLogs[i] = width*i/middleLogs.length + random(-100, 100);
			}

			for (int i = 0; i < bottomLogs.length; i++) {
				bottomLogs[i] = width*i/bottomLogs.length + random(-100, 100);
			}
		}
	}
}
