class Food
{
  PVector position;
  float radius; //metade do tamanho da comida
  

  //Construtor 
  Food(float radius, int PixelSize)
  {
    this.radius = radius;
    refresh(PixelSize); 
  }

  //função para definir a posiçao da comida (aleatória dentro dos limites da area de jogo)
  void refresh(int PixelSize)
  {
    position = new PVector(random(PixelSize + radius, width - PixelSize - radius), random(PixelSize + radius, height- PixelSize - radius));
  }

  void draw()
  {
    pushStyle();

    noStroke();
    fill(255); //mudar a cor da comida
    circle(position.x, position.y, radius*2); // circle(x, y, diameter)

    popStyle();
  }
}