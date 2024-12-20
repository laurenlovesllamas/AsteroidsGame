class Spaceship extends Floater {
  public Spaceship() {
    myCenterX = width / 2;
    myCenterY = height / 2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    myColor = color(255, 255, 255); 
    corners = 3;  // Spaceship is a triangle
    xCorners = new float[] { 15, -10, -10 };
    yCorners = new float[] { 0, 10, -10 };
  }
}
