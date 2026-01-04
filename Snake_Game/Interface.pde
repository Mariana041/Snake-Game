class Interface
{
    //Referencias
    Game game;
    PImage lifeImg; // PNG para mostrar vidas

    int offset = 10; //translação da linha para o jogador e comida ficar dentro dos quadrados 

    Interface(Game game, PImage lifeImg)
    {
        this.game = game; // Guarda referência
        this.lifeImg = lifeImg;
    }

    //pontuação durante o jogo
    void drawScore()
    {
        fill(0);
        textSize(20);
        textAlign(LEFT);
        text("Score: " + game.score, 30, 45);


        fill(255);
        textSize(12);
        textAlign(RIGHT, BOTTOM);
        text("Introdução ao Desenvolvimento de Jogos - 2025/26", width - 5, height - 3);
    }

    //Renderiza as vidas da cobra 
    void drawLives() 
    {
        for (int i = 0; i < game.lives; i++) //Desenha uma imagem por cada vida
        {
            image(lifeImg, 10 + i * (lifeImg.width + 5), height - lifeImg.height - 10); //image(img, pos_x, pos_y); 
        }
    }

    //menu inicial
    void drawMenu()
    {
        fill(0);
        textAlign(CENTER);

        textSize(40);
        text("Snake Game", width/2, height/2 - 40);

        textSize(20);
        text("Press SPACE to start", width/2, height/2);
        
        textSize(25);
        text("Controls", width/2, height/2 + 55 + 15);

        textSize(15);
        text("UP, W -> up", width/2, height/2 + 80 + 15);
        text("DOWN, S -> down", width/2, height/2 + 100 + 15);
        text("LEFT, A -> left", width/2, height/2 + 120 + 15);
        text("RIGHT, D -> right", width/2, height/2 + 140 + 15);

        textSize(12);
        textAlign(RIGHT, BOTTOM);
        text("Mafalda Dias - A049391 \n Marco Sousa - A049181 \n Mariana Cardoso - A041337 \n Mariana Fernandes - A049259 \n", width - 5, height - 10);
        text("Introdução ao Desenvolvimento de Jogos - 2025/26", width - 5, height - 3);
    }

    //game over
    void drawGameOver()
    {
        fill(0);
        textAlign(CENTER);

        textSize(40);
        text("Game Over", width/2, height/2 - 20);

        textSize(20);
        text("Score: " + game.score, width/2, height/2 + 10);
        text("Press R to restart", width/2, height/2 + 40);
    }

    //limites do ecra 
    void drawBorder(int PixelSize) 
    {
        fill(100); // cinzento da moldura
        noStroke();

        // cima
        for (int x = 0; x < width; x = x + PixelSize) 
        {
            //rect(pos.x, pox.y, width, height)
            rect(x, 0, PixelSize, PixelSize); 
        }

        // baixo
        for (int x = 0; x < width; x = x + PixelSize) 
        {
            rect(x, height - PixelSize, PixelSize, PixelSize);
        }

        // Esquerda
        for (int y = 0; y < height; y = y + PixelSize) 
        {
            rect(0, y, PixelSize, PixelSize);
        }

        // Direita
        for (int y = 0; y < height; y = y + PixelSize) 
        {
            rect(width - PixelSize, y, PixelSize, PixelSize);
        }
    }

    void drawGrid(int PixelSize)
    {
        
        stroke(100, 155); // cor das linhas com alpha (transparencia)
        strokeWeight(0.5);

        // linhas verticais
        for (int x = 0; x < width; x += PixelSize) 
        {
            line(x, 0, x, height);
        }

        // linhas horizontais
        for (int y = offset; y < height; y += PixelSize) 
        {
            line(0, y, width, y);
        }

        

    }

}