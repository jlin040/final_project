class Lane{
  int type; //generate random type in constructor from 0-2 inclusive
  float y;
  
  int numObjects; // generate random amount in constructor
  float w; // generate random width in constructor?, if type == 0 set width to 800
  float spacing; // generate random spacing in constructor
  float laneSpeed;
  float[numObjects] xcoords; // can populate using multiplation of spacing (w?)
  
  // holds color pallets for different types of lanes, 0 grass, 1 road, 2 water
  color[][3] laneColors = new color[][3] {
    new color[] {#528148}, // grass
    new color[] {#333F48, #000000}, // road and car
    new color[] {#277EBF, #623322} // water and log
  };
  
  public Lane(float y){
    type = (int) (Math.random() * 3);
    this.y = y;
    
    //numObjects = gen random w/ restrictions;
    //if (type == 0) w = 800;
    //else w = gen random w/ restrictions
    //spacing = gen random w/ restrictions
    //laneSpeed = gen random w/ restrictions;\
    //xcoords = new float[numObjects];
    //for (int i = 0; i < numObjects; i++) {
    //  xcoords[i] = i * (w + spacing);
    //}
  }
  
  // prints one lane, can invoke for each lane in screen in frogger printLanes() call background() first to reset slates to prevent overlapping?
  public void printLane() {
    noStroke();
    if (type == 0) {
      fill(laneColors[0][0]);
      rect(0, y, w, 50);
    }
    else {
      fill(laneColors[type][0]);
      rect(0, y, 800, 50);
      fill(laneColors[type][1]);
      for (float x: xcoords) rect(x, y, w, 50);

    }
  } 
  
  // updates xcoords of all objects in lane, can invoke for each lane in screen in frogger updateLanes()?
  public void updateLane() {
    // basic movement only, implement check for when obstacle loops around again,
    for (int i = 0; i < numObjects; i++) {
      xcoords[i] += laneSpeed;
    }
  }
}   
