void theLogs(){
	//checking if it is in the water
	if (ty > (grassHeight - largeHeight / 3) && 
			ty < (grassHeight - largeHeight / 3) + largeHeight) { 
		//it is off the log
		onLog = false;
	} else {
		//otherwise, setting the guy on the log
		onLog = true;
	}
	//drawing toplogs 
	for (int i = 0; i < topLogs.length; i++) {
		//speed and going back to beginning
		topLogs[i] = (topLogs[i] + topLogSpeed) % width;
		//drawing logs
		drawLogs(topLogs[i], height/6-5, 'top', i);
		// if on the log, increment the speed of the guyY to the speed of the log, and on the log is true
		if (tx > topLogs[i]       - logWidth / 2 && 
				tx < topLogs[i]       + logWidth / 2 && 
				ty > (height / 6 - 5) - logHeight && 
				ty < (height / 6 - 5) + logHeight / 2
		) {
			tx += topLogSpeed;
			onLog = true;
		}
	}
	//drawing middlelogs 
	for (int i = 0; i < middleLogs.length; i++) {
		middleLogs[i] = (middleLogs[i] + middleLogSpeed) % width;
		//drawing logs
		drawLogs(middleLogs[i], height/8*3, 'top', i);
		// if on the log, increment the speed of the guyY to the speed of the log, and on the log is true
		if (tx > middleLogs[i]       - logWidth / 2 && 
				tx < middleLogs[i]       + logWidth / 2 && 
				ty > (height/8*3) - logHeight && 
				ty < (height/8*3) + logHeight / 2
		) {
			tx += middleLogSpeed;
			onLog = true;
		}
	}
	
	//drawing bottomlogs 
	for (int i = 0; i < bottomLogs.length; i++) {
		bottomLogs[i] = (bottomLogs[i] - bottomLogSpeed);
		if (bottomLogs[i] < 0) {
			bottomLogs[i] = width;
		}
		//drawing logs
		drawLogs(bottomLogs[i], height/4+10, 'bottom', i);
		// if on the log, increment the speed of the guyY to the speed of the log, and on the log is true
		if (tx > bottomLogs[i]       - logWidth / 2 && 
				tx < bottomLogs[i]       + logWidth / 2 && 
				ty > (height/4+10) - logHeight && 
				ty < (height/4+10) + logHeight / 2
		) {
			tx -= bottomLogSpeed;
			onLog = true;
		}
	}
	//if it is not on the log, it go to the original coordinares
	if (onLog == false) {
		goToStart();
	}
}

//same for logs
void drawLogs(int logX, int logY, int logLane, int logIndex){
	pushMatrix();
	translate(logX, logY);
	noStroke();
	rectMode(CENTER);
	fill(139,69,19); 
	rect(0, 0, logWidth, logHeight, 7);
	rectMode(CORNER);
	popMatrix();
}
