class Spaceship extends Floater {
  Spaceship() {
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

  //Spaceship moves by accelerating in the direction it's facing
  public void move() {
    super.move();
    // System.out.println(mySpaceship.myPointDirection);
  }

  // Show the spaceship as a triangle
  public void show() {
    fill(myColor);
    stroke(255);
    pushMatrix();
    translate(myCenterX, myCenterY);
    // rotate(radians(myPointDirection));
    beginShape();
     for (int i = 0; i < corners; i++) {
      float angle = radians(myPointDirection);
      float newx = (xCorners[i] * cos(angle)) - (yCorners[i] * sin(angle));
      float newy = (xCorners[i] * sin(angle)) + (yCorners[i] * cos(angle));
      vertex(newx, newy);
    } 
    endShape(CLOSE);
    popMatrix();
  }
}
