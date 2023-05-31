//if the game is still playing, and you have not hit the top grass, then move w/ the arrow keys
void keyPressed() {
	if (key == CODED && 
			gameEnd == false && 
			ifWon == false && 
		 stop == false) {
		if (keyCode == UP){
			if(guyY > 50){
				ty -= grassHeight;
				score += 1;
				//restart = false;
			}
		}
		if (keyCode == LEFT) {
			if(guyX > 50){
				tx -= click;
			}
		}
		if (keyCode == RIGHT) {
			if(guyX < width-85){
				tx += click;
			}
		}
		if (keyCode == DOWN) {
			if (guyY < height-80){
				ty += grassHeight;
			}
		}
	}
}
//going to the start of the program
void goToStart() {
	tx = (width/2)-25;
	ty = height-70;
	life--;
}
