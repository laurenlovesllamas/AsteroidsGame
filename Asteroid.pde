class Asteroid extends Floater {
  float turnSpeed;  // Variable for asteroid turning speed

  public Asteroid() {
    myCenterX = random(width);
    myCenterY = random(height);
    myDirectionX = random(-1, 1);
    myDirectionY = random(-1, 1);
    myPointDirection = random(360);
    turnSpeed = random(-2, 2);  // Random turning speed
    myColor = color(150, 150, 150);  // Gray color for asteroids
    corners = 8;  // Asteroid shape has 8 corners
    
    // Define a more irregular shape for the asteroid
    xCorners = new float[corners];
    yCorners = new float[corners];
    for (int i = 0; i < corners; i++) {
      xCorners[i] = random(-15, 15);
      yCorners[i] = random(-15, 15);
    }
  }

  // Move the asteroid and apply the turning speed
  public void move() {
    super.move();
    turn((int)turnSpeed);  // Apply the turning speed to rotate the asteroid
  }
}
