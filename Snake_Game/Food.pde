class Food{
  PVector position;
  float radius;

  Food(float radius){
    //this.radius = radius;
    refresh();
  }

  void refresh(){
    // position = new PVector(random(radius, width - radius), random(radius, height - radius));
    position = new PVector(random(width),random(height), radius);  
    

    if(food.position.x >= width || food.position.x <= 0){
      position = new PVector(random(width), random(height), radius);
    }

    if(food.position.y > height || food.position.y < 0){
      position = new PVector(random(width), random(height), radius);
    }
  }

  void draw(){
    pushStyle();

    noStroke();
    fill(255);
    circle(position.x, position.y, radius*2); // circle(x, y, diameter)
    
    popStyle();
  }
}