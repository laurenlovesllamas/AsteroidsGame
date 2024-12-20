abstract class Floater {
  protected float myCenterX, myCenterY;
  protected float myDirectionX, myDirectionY;
  protected float myPointDirection;
  protected int corners;
  protected float[] xCorners, yCorners;
  protected int myColor;

  // Rotate the object
  public void rotate(float degrees) {
    myPointDirection += degrees;
  }

  // Accelerate the object in the direction it's facing
  public void accelerate(float amount) {
    float angle = radians(myPointDirection);
    myDirectionX += cos(angle) * amount;
    myDirectionY += sin(angle) * amount;
  }

  // Move the object
  public void move() {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    
    // Wrap around the screen if it goes off the edges
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  // Show the object
  public void show() {
    fill(myColor);
    stroke(255);
    pushMatrix();
    translate(myCenterX, myCenterY);
    // rotate(radians(myPointDirection));
    beginShape();
     for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    //Connects corners 
    endShape(CLOSE);
    popMatrix();
  }
}
