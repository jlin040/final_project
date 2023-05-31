void setup () {
	size(width, height);
	//center of text is the coordinates
	textAlign(CENTER, CENTER);
	//print(window.innerWidth + ", " + window.innerHeight);
	//prompt for music
	//answer = prompt("Would you like to have music? (yes/no)");
	//center of text is the coordinates
	textAlign(CENTER, CENTER);
	//setting up music
	//music = new Audio();
	//music.setAttribute("src", "jackpot.mp3");
	//music.play();
	////repeating
	//music.addEventListener("ended", repeat);
	////if the answer is one of these, then play music
	//if (answer == "y" || answer == "yes" || answer == "Yes" || answer == "YES"){
	//	playing = true;
	//	//otherwise, stop it
	//}else{
	//	music.pause();
	//}	
	// win = new Audio();
	// win.setAttribute("src", "Ta_Da-SoundBible_com-1884170640.mp3");
	// beep = new Audio();
	// beep.setAttribute("src", "beep-10.mp3");
	// lost = new Audio();
	// lost.setAttribute("src", "fail-buzzer-02.mp3");
	//if the answer is one of these, then play music
	//setting up topcars
	for (int i = 0; i < topCars.length; i++) {
		//putting the cars anywhere between these coordinates
		topCars[i] =int( width*i/topCars.length + random(-width/12, width/12));
		//random colors
		topColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
	}
	//setting up middlecars
	for (int i = 0; i < middleCars.length; i++) {
		//putting the cars anywhere between these coordinates
		middleCars[i] =int( width*i/middleCars.length + random(-width/12, width/12));
		//random colors
		middleColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
	}
	//setting up bottomcars
	for (int i = 0; i < bottomCars.length; i++) {
		//putting the cars anywhere between these coordinates
		bottomCars[i] = int(width*i/bottomCars.length + random(-width/12, width/12));
		//random colors
		bottomColor[i] = color(random(0, 255), random(0, 255), random(0, 255));
	}
	
	//same for all logs, and randomly placing between coordinates
	for (int i = 0; i < topLogs.length; i++) {
		topLogs[i] = int(width*i/topLogs.length + random(-100, 100));
	}
	
	for (int i = 0; i < middleLogs.length; i++) {
		middleLogs[i] = int(width*i/middleLogs.length + random(-100, 100));
	}
	
	for (int i = 0; i < bottomLogs.length; i++) {
		bottomLogs[i] = int(width*i/bottomLogs.length + random(-100, 100));
	}
}

//repeating music
//void repeat() {
//	music.play();
//}
