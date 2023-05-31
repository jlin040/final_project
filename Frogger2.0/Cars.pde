//drawing cars
void drawCar (int x, int y, int lane, int index){
	pushMatrix();
	//putting x and y coordinates in different locations
	translate(x, y);
	noStroke();
	//wheel width, x and y of coordinates
	int wheelWidth = 20;
	int wheelHeight = 20; 
	int wheelX = int(carWidth/3.5);
	int wheelY = carHeight/2 - wheelWidth/5;
	rectMode(CENTER);
	//drawing wheels
	fill(0,0,0);
	rect(-wheelX, wheelY, wheelWidth, wheelHeight, 7);
	rect(wheelX, wheelY, wheelWidth, wheelHeight, 7);
	rect(-wheelX, -wheelY, wheelWidth, wheelHeight, 7);
	rect(wheelX, -wheelY, wheelWidth, wheelHeight, 7);
	//fill colors for each car row
	if (lane == "top") {
		fill(topColor[index]);
	} else if (lane == "middle") {
		fill(middleColor[index]);
	}
	else {
		fill(bottomColor[index]);
	}
	//drawing rectangle
	rect(0, 0, carWidth, carHeight, 8);
	fill(0, 0, 0);
	rectMode(CORNER);
	popMatrix();
}

//adding cars every 4 levels
void addCar() {
	if (level % 4 == 0 && topCars.length == (floor(width/300))) {
		topCars.push(0);
		middleCars.push(0);
		bottomCars.push(0);
		for (int i = 0; i < topCars.length; i++) {
			topCars[i] = int(width*i/topCars.length + random(-width/12, width/12));
			topColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
		}

		for (int i = 0; i < middleCars.length; i++) {
			middleCars[i] = int(width*i/middleCars.length + random(-width/12, width/12));
			middleColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
		}

		for (int i = 0; i < bottomCars.length; i++) {
			bottomCars[i] = int(width*i/bottomCars.length + random(-width/12, width/12));
			bottomColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
		}
	}
}
// drawing cars
void doCars() {
	for (int i = 0; i < topCars.length; i++) {
		topCars[i] += topCarSpeed;
		//changing color every time it goes through screen
		if (topCars[i] > width) {
			topCars[i] = -carWidth/2;
			topColor[i] = color(random(255), random(255), random(255));
		}
		drawCar(topCars[i], height/5*3, 'top', i);
		//detecting if it is hitting the car, then go to start
		if (tx <= topCars[i] + 35 && tx + 85 >= topCars[i] && ty <= height/5*3 + 15 && ty + 65 >= height/5*3) {
			goToStart();
		}
	}
	//same for other cars
	for (int i = 0; i < middleCars.length; i++) {
		middleCars[i] = (middleCars[i] - middleCarSpeed);
		if (middleCars[i] < 0) {
			middleCars[i] = width;
			middleColor[i] = color(random(255), random(255), random(255));
		}
		drawCar(middleCars[i], height/7*5, 'middle', i);
		if (tx <= middleCars[i] + 35 && tx + 85 >= middleCars[i] && ty <= height/7*5 + 15 && ty + 65 >= height/7*5) {
			goToStart();
		}
	}
	
	for (int i = 0; i < bottomCars.length; i++) {
		bottomCars[i] += bottomCarSpeed;
		if (bottomCars[i] > width) {
			bottomCars[i] = -carWidth/2;
			bottomColor[i] = color(random(255), random(255), random(255));
		}
		drawCar(bottomCars[i], height/6*5, 'bottom', i);
		if (tx <= bottomCars[i] + 35 && tx + 85 >= bottomCars[i] && ty <= height/6*5 + 15 && ty + 65 >= height/6*5) {
			goToStart();
		}
	}
}
