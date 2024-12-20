// Declare the spaceship, asteroids, and bullets
Spaceship mySpaceship;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Star[] stars;

void setup() {
  size(800, 600);  
  mySpaceship = new Spaceship();  // Initialize spaceship

  // Initialize stars
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  // Create some initial asteroids
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);  // Clear the screen
  
  // Draw and move stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }

  mySpaceship.move();
  mySpaceship.show();

  // Draw and move bullets
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.move();
    bullet.show();

    // Check for collisions with asteroids
    for (int j = asteroids.size() - 1; j >= 0; j--) {
      Asteroid asteroid = asteroids.get(j);
      if (dist(bullet.myCenterX, bullet.myCenterY, asteroid.myCenterX, asteroid.myCenterY) < 15) {
        asteroids.remove(j);
        bullets.remove(i);
        break;  // Stop checking once we remove the asteroid and bullet
      }
    }
  }

  // Move and display asteroids
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.move();
    asteroid.show();

    // Check for collision with spaceship
    if (dist(mySpaceship.myCenterX, mySpaceship.myCenterY, asteroid.myCenterX, asteroid.myCenterY) < 20) {
      asteroids.remove(i);  // Remove asteroid if it collides with spaceship
    }
  }
}

void keyPressed() {
  if (key == 'a'){
    mySpaceship.turn(-5);  // Turn left
  } else if (key == 'd') {
    mySpaceship.turn(5);  // Turn right
  } else if (key == 'w') {
    mySpaceship.accelerate(0.1);  // Accelerate forward
  } else if (key == ' ') {  // Spacebar to shoot
    bullets.add(new Bullet(mySpaceship));  // Create a new bullet
  } else if (key == 'h') {
    // Hyperspace: teleport to random position and direction
    mySpaceship.myCenterX = random(width);
    mySpaceship.myCenterY = random(height);
    mySpaceship.myDirectionX = 0;
    mySpaceship.myDirectionY = 0;
    mySpaceship.myPointDirection = random(360);
  }
}
