Spaceship mySpaceship;
Star[] stars;

void setup() {
  size(800, 600);  
  mySpaceship = new Spaceship();  

  // Initialize stars
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);  
  
for (int i = 0; i < stars.length; i++) {
    stars[i].show();
}
  
  mySpaceship.move();
  mySpaceship.show();
}

void keyPressed() {
  if (key == 'a') {
    mySpaceship.rotate(-5);  // Turn left
  } else if (key == 'd') {
    mySpaceship.rotate(5);   // Turn right
  } else if (key == 'w') {
    mySpaceship.accelerate(0.1);  // Accelerate forward
  } else if (key == 'h') {
    // Hyperspace: teleport to random position and direction
    mySpaceship.myCenterX = random(width);
    mySpaceship.myCenterY = random(height);
    mySpaceship.myDirectionX = 0;
    mySpaceship.myDirectionY = 0;
    mySpaceship.myPointDirection = random(360);
  }
}

class Spaceship extends Floater {
  Spaceship() {
    myCenterX = width / 2;
    myCenterY = height / 2;

    myDirectionX = 0;
    myDirectionY = 0;

    myPointDirection = 0;

    // Shape/appearance
    myColor = color(255, 255, 255); 
    corners = 3; 

    // Define spaceship shape
    xCorners = new float[] { 0, -10, 10 };
    yCorners = new float[] { -15, 10, 10 };
  }
}

abstract class Floater {
  protected float myCenterX, myCenterY;
  protected float myDirectionX, myDirectionY;
  protected float myPointDirection;

  protected int corners;
  protected float[] xCorners, yCorners;
  protected int myColor;

  public void rotate(float degrees) {
    myPointDirection += degrees;
  }

  public void accelerate(float amount) {
    float angle = radians(myPointDirection);
    myDirectionX += cos(angle) * amount;
    myDirectionY += sin(angle) * amount;
  }

  public void move() {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
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
class Star {
  float x, y;

  Star() {
    x = random(width);
    y = random(height);
  }

  void show() {
    stroke(255);  
    point(x, y);
  }
}
