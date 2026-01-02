//Instanciar as classes do jogo 
Snake snake;
Food food;
InputManager input;
Game game;
Interface ui;
ParticleSystem ps;

PImage lifeImg; // PNG para mostrar vidas
int PixelSize = 20; // tamanho da snake e da comida (unidade de medida do jogo -> tamanho de cada quadrado)

// PERCORRE APENAS UMA VEZ
//Criar o ambiente de jogo

void setup() 
{
    size(1024, 800);
    frameRate(10); // Velocidade do jogo (Frames por segundo)

    lifeImg = loadImage("heart.png"); //Carregar PNG da vida

    // Inicializar objetos
    input = new InputManager();
    food = new Food(10, PixelSize); //(raio, pixelSize)

    //pos, vel, col, width, height, food, input
    snake = new Snake(new PVector(width/2, height/2), new PVector(PixelSize, PixelSize), color(15,56,15), PixelSize, PixelSize, food, input);
    game = new Game();
    ui = new Interface(game);
    ps = new ParticleSystem();
}

// PERCORRE EM LOOP A CADA FRAME
//Menu, movimento, colisão, desenhar

void draw() 
{
    background(139,172,15);

    //verificação do estado do jogo
    if (game.inMenu) 
    {
        ui.drawMenu();
        return; //o draw é interrompido para não processar o jogo atrás do menu
    }

    if (game.gameOver) 
    {
        ui.drawGameOver();
        return;
    }


    snake.update(); // movimentar a cabeça da cobra (classe snake)

    //verificar se coldiu com a comida 
    boolean foodConsumed = snake.collision();
    if (foodConsumed) 
    {
        println("colidiu com a comida");
        game.score++; //Incrementa pontuação
    }

    // atualização da cauda
    //Se a cobra se moveu, a cauda deve seguir a posição anterior da cabeça
    if (!snake.position.equals(snake.lastPosition)) snake.tail.update(snake.lastPosition.copy());
    

    ui.drawGrid(PixelSize); //desenho das linhas de fundo
    ui.drawBorder(PixelSize); //desenho das paredes

    // verificar morte
    if (snake.hitWall(PixelSize) || snake.hitTail()) 
    {
        //(x, y, col, amount)
        ps.explosion(snake.position.x, snake.position.y, color(255, 0, 0), 30); // criar o sistema de particulas
        game.loseLife(); //perde a vida
        snake.resetPosition(); //faz reset ao centro do ecra
        food.refresh(PixelSize);  // Gera nova comida 
        return;
    }

    // desenhar todos os elementos
    ps.update(); //drocessa e desenha o sitema de partículas
    snake.draw_snake(); //desenha a cabeça e os segmentos da cauda
    ui.drawScore(); //desenha o score
    food.draw();
    drawLives(); //icons da vida
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
    // Controle da snake
    if (keyCode == UP || key == 'w' || key == 'W') input.up = true;
    if (keyCode == DOWN || key == 's' || key == 'S') input.down = true;
    if (keyCode == LEFT || key == 'a' || key == 'A') input.left = true;
    if (keyCode == RIGHT || key == 'd' || key == 'D') input.right = true;

    //teclas do controlo dos menus 
    if (game.inMenu && key == ' ') 
    {
        game.startGame(); // começar o jogo 
        println("clicou no espaco");
    }

    if (game.gameOver && (key == 'r' || key == 'R')) 
    {
        game.reset();
        snake.resetPosition();
        loop(); // retoma draw
        println("reiniciou o jogo");
    }

    if (game.gameOver && (key == 'm' || key == 'M'))
    { 
        game.inMenu = true;
        println("retoma ao menu inicial");
    }
}

void keyReleased() 
{
    if (keyCode == UP || key == 'w' || key == 'W') input.up = false;
    if (keyCode == DOWN || key == 's' || key == 'S') input.down = false;
    if (keyCode == LEFT || key == 'a' || key == 'A') input.left = false;
    if (keyCode == RIGHT || key == 'd' || key == 'D') input.right = false;
}