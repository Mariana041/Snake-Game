

//PImage lifeImg; // PNG para mostrar vidas
//int PixelSize = 20; // tamanho da snake e da comida


void setup() 
{
    
    //frameRate(10); // Velocidade do jogo

    //lifeImg = loadImage("heart.png"); // Carregar a imagem da vida

    // Inicializar objetos

}


void draw() 
{
    background(0);

    //Verificação de qual tela deve ser mostrada
    //snake.update();
    //verificaçao se a cobra colidiu com a comida e aumentar a pontuação
    //atualizar a tail 
    //ui.drawGrid(PixelSize);
    //ui.drawBorder(PixelSize);
    //verificar a colisao com a Border
    //desenhar os elementos de jogo
    //drawLives(); 
    

}

void drawLives() 
{
    for (int i = 0; i < game.lives; i++) 
    {
        image(lifeImg, 10 + i * (lifeImg.width + 5), height - lifeImg.height - 10);
    }
}

void keyPressed() 
{
    // Controlar movimento da cobra
    

    // teclas da interface
    if (game.inMenu && key == ' ') game.startGame();
    if (game.gameOver && (key == 'r' || key == 'R')) 
    {
        game.reset();
        snake.resetPosition();
        loop(); // retoma draw
    }
    if (game.gameOver && (key == 'm' || key == 'M')) game.inMenu = true;
}


void keyReleased() 
{
    // Controlar movimento da cobra
}