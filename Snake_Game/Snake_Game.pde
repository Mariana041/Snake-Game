// ----------------------------
// DECLARAÇÕES GLOBAIS
// ----------------------------
Snake snake;
Food food;
InputManager input;
Game game;
Interface ui;

PImage lifeImg; // PNG para mostrar vidas
int PixelSize = 20; // tamanho da snake e da comida

// ----------------------------
// SETUP DO PROCESSING
// ----------------------------
void setup() {
    size(600, 600);
    frameRate(10); // Velocidade do jogo

    // Carregar PNG da vida (coloque heart.png na pasta "data")
    lifeImg = loadImage("heart.png");

    // Inicializar objetos
    input = new InputManager();
    food = new Food(10, PixelSize);
    snake = new Snake(new PVector(width/2, height/2), new PVector(PixelSize, PixelSize), color(0, 255, 0), PixelSize, PixelSize, food, input);
    game = new Game();
    ui = new Interface(game);
}

// ----------------------------
// LOOP PRINCIPAL
// ----------------------------
void draw() {
    background(0);

    if (game.inMenu) {
        ui.drawMenu();
        return;
    }

    if (game.gameOver) {
        ui.drawGameOver();
        return;
    }

    // 1️⃣ mover a snake (só cabeça)
    snake.update();

    // 2️⃣ verificar comida
    boolean ateFood = snake.collision();
    if (ateFood) {
        game.score++;
    }

    // 3️⃣ atualizar cauda (AGORA é seguro)
    if (!snake.position.equals(snake.lastPosition)) {
    snake.tail.update(snake.lastPosition.copy());
}
ui.drawGrid(PixelSize);
ui.drawBorder(PixelSize);

    // 4️⃣ verificar morte
    if (snake.hitWall(PixelSize) || snake.hitTail()) {
    game.loseLife();
    snake.resetPosition();
    food.refresh(PixelSize);  // Gera nova comida, evita comida em lugares errados
    return;
}

    // 5️⃣ desenhar tudo
    food.draw();
    snake.draw_snake();
    ui.drawScore();
    drawLives();
}


// ----------------------------
// DESENHA VIDAS COM PNG
// ----------------------------
void drawLives() {
    for (int i = 0; i < game.lives; i++) {
        image(lifeImg, 10 + i * (lifeImg.width + 5), height - lifeImg.height - 10);
    }
}

// ----------------------------
// INPUT: teclas pressionadas
// ----------------------------
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

// ----------------------------
// INPUT: teclas soltas
// ----------------------------
void keyReleased() {
    if (keyCode == UP)    input.up = false;
    if (keyCode == DOWN)  input.down = false;
    if (keyCode == LEFT)  input.left = false;
    if (keyCode == RIGHT) input.right = false;
}