class Interface
{
    Game game;
    PImage lifeImg;

    Interface(Game game)
    {
        this.game = game; // Guarda referência
    }

    //pontuação durante o jogo
    void drawScore()
    {
        fill(255);
        textSize(20);
        textAlign(LEFT);
        text("Score: " + game.score, 10, 25);
    }

    void drawLives() 
    {
        for (int i = 0; i < game.lives; i++) 
        {
            image(lifeImg, 10 + i * (lifeImg.width + 5), height - lifeImg.height - 10);
        }
    }

    //menu inicial
    void drawMenu()
    {
        fill(255);
        textAlign(CENTER);

        textSize(40);
        text("Snake Game", width/2, height/2 - 40);

        textSize(20);
        text("Press SPACE to start", width/2, height/2);
        text("High Score: " + game.highScore, width/2, height/2 + 40);
    }

    //game over
    void drawGameOver()
    {
        fill(255, 0, 0);
        textAlign(CENTER);

        textSize(40);
        text("Game Over", width/2, height/2 - 20);

        textSize(20);
        text("Score: " + game.score, width/2, height/2 + 10);
        text("Press R to restart", width/2, height/2 + 40);
    }

    void drawBorder(int PixelSize) 
    {
        fill(100); // cinzento da moldura
        noStroke();

        // Topo
        for (int x = 0; x < width; x += PixelSize) 
        {
            rect(x, 0, PixelSize, PixelSize);
        }

        // Fundo
        for (int x = 0; x < width; x += PixelSize) 
        {
            rect(x, height - PixelSize, PixelSize, PixelSize);
        }

        // Esquerda
        for (int y = 0; y < height; y += PixelSize) 
        {
            rect(0, y, PixelSize, PixelSize);
        }

        // Direita
        for (int y = 0; y < height; y += PixelSize) 
        {
            rect(width - PixelSize, y, PixelSize, PixelSize);
        }
    }

}