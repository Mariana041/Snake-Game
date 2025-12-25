class Food
{
  PVector position;
  float radius;

  Food(float radius)
  {
    this.radius = radius;
    refresh();
  }

  void refresh()
  {
    position = new PVector(random(radius, width - radius), random(radius, height - radius));
    
  }

  void draw()
  {
    pushStyle();

    noStroke();
    fill(255);
    circle(position.x, position.y, radius*2); // circle(x, y, diameter)
    
    popStyle();
  }
}