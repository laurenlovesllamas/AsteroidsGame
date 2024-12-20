class Bullet extends Floater {
  Bullet(Spaceship theShip) {
    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;
    myPointDirection = theShip.myPointDirection;
    
    // Use spaceship velocity
    myDirectionX = theShip.myDirectionX;
    myDirectionY = theShip.myDirectionY;
    
    myColor = color(255, 0, 0);  // Red bullet
    corners = 20;  // Bullet is circular, use many corners
    xCorners = new float[corners];
    yCorners = new float[corners];
    
    for (int i = 0; i < corners; i++) {
      xCorners[i] = cos(TWO_PI * i / corners) * 5;  // Small radius for the bullet
      yCorners[i] = sin(TWO_PI * i / corners) * 5;
    }
    
    accelerate(6.0);  // Push the bullet forward
  }

  public void move() {
    super.move();
  }

  public void show() {
    fill(myColor);
    stroke(255);
    pushMatrix();
    translate(myCenterX, myCenterY);
    rotate(radians(myPointDirection));
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
