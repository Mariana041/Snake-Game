
Snake snake;
Food food;
InputManager input;
Game game;
Interface ui;
ParticleSystem ps;

PImage lifeImg; // PNG para mostrar vidas
int PixelSize = 20; // tamanho da snake e da comida (unidade de medida do jogo -> tamanho de cada quadrado)
int deathTimer = 0; //ter um delay após a perder uma vida (para conseguir ver as particulas)

// PERCORRE APENAS UMA VEZ

void setup() {
    size(600, 600);
    frameRate(10); // Velocidade do jogo (Frames por segundo)

    lifeImg = loadImage("heart.png"); //Carregar PNG da vida

    // Inicializar objetos
    input = new InputManager();
    food = new Food(10, PixelSize); //(raio, pixelSize)

    //pos, vel, col, width, height, food, input
    snake = new Snake(new PVector(width/2, height/2), new PVector(PixelSize, PixelSize), color(0, 255, 0), PixelSize, PixelSize, food, input);
    game = new Game();
    ui = new Interface(game);
    ps = new ParticleSystem();
}

// ----------------------------
// LOOP PRINCIPAL
// ----------------------------
void draw() 
{
    background(0);

    if (game.inMenu) 
    {
        ui.drawMenu();
        return;
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
        game.score++;
    }

    // 3️⃣ atualizar cauda (AGORA é seguro)
    if (!snake.position.equals(snake.lastPosition)) 
    {
        snake.tail.update(snake.lastPosition.copy());
    }
    ui.drawGrid(PixelSize);
    ui.drawBorder(PixelSize);

    // 4️⃣ verificar morte
    if (snake.hitWall(PixelSize) || snake.hitTail()) 
    {
        ps.explosion(snake.position.x, snake.position.y, color(255, 0, 0), 30);
        game.loseLife();
        snake.resetPosition();
        food.refresh(PixelSize);  // Gera nova comida, evita comida em lugares errados
        return;
    }

    // 5️⃣ desenhar tudo
    food.draw();
    ps.update();
    snake.draw_snake();
    ui.drawScore();
    drawLives();
}



void drawLives() 
{
    for (int i = 0; i < game.lives; i++) 
    {
        image(lifeImg, 10 + i * (lifeImg.width + 5), height - lifeImg.height - 10);
    }
}


void keyPressed() {
    // Controle da snake
    if (keyCode == UP)    input.up = true;
    if (keyCode == DOWN)  input.down = true;
    if (keyCode == LEFT)  input.left = true;
    if (keyCode == RIGHT) input.right = true;

    // Menu ou restart
    if (game.inMenu && key == ' ') game.startGame();
    if (game.gameOver && (key == 'r' || key == 'R')) {
        game.reset();
        snake.resetPosition();
        loop(); // retoma draw
    }
    if (game.gameOver && (key == 'm' || key == 'M')) game.inMenu = true;
}

void keyReleased() {
    if (keyCode == UP)    input.up = false;
    if (keyCode == DOWN)  input.down = false;
    if (keyCode == LEFT)  input.left = false;
    if (keyCode == RIGHT) input.right = false;
}