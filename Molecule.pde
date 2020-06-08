class Molecule{
  //Declare variables
  float xPos;
  float yPos;
  float direction; //Angle in radians
  float directionActual; //Angle in radians
  
  Molecule(float xStart, float yStart, int directionInitial){
    xPos = xStart;
    yPos = yStart;
    direction = directionInitial;
    getDirectionActual();
  }
  
  void getDirectionActual(){
    directionActual = direction % (PI/2.0);
  }
  
  //Method for collision detection with walls. Assumes elastic collision
  void checkCollisionWithWall(int width, int height){
    boolean changed = false;
    //Check x
    if (xPos > width){
      float excessDistance = xPos - width;
      xPos = width - excessDistance;
      changed = true;
    }
    else if (xPos < 0){
      xPos *= -1;
      changed = true;
    }
    //Check y
    if (yPos > height){
      float excessDistance = height - yPos;
      yPos = height - excessDistance;
      changed = true;
    }
    else if (yPos < 0){
      yPos *= -1;
      changed = true;
    }
    //Get new direction
    if (changed){
      direction = TWO_PI - direction;
    }
  }
  
  void move(float moveDist, int width, int height){
    //Uses pythagoras
    float yIncrease = (moveDist * (sin(directionActual)));
    float xIncrease = (moveDist * (cos(directionActual)));
    //Checks if movement is up/down and left/right
    //Checks y
    if (direction <= (PI/2) || direction >= ((3*PI)/2)){
      yPos -= yIncrease;
    }
    else{
      yPos += yIncrease;
    }
    //Checks x
    if (direction <= (PI)){
      xPos += xIncrease;
    }
    else{
      xPos -= xIncrease;
    }
    checkCollisionWithWall(width, height);
  }
  
}
