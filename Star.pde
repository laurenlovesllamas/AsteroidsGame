class Star {
  float x, y;

  // Constructor to randomly position the star
  Star() {
    x = random(width);  // Random x position within screen width
    y = random(height); // Random y position within screen height
  }

  // Method to display the star
  void show() {
    stroke(255);  // White color for stars
    point(x, y);  // Draw the star as a point at (x, y)
  }
}
