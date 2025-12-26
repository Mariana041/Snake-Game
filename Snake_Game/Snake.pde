class Snake // Classe do jogador
{
    Food food;
    Tail tail;
    InputManager input;

    PVector position, velocity;
    int snake_width, snake_height;
    color colour;
    PVector lastPosition;

    //Construtor
    //Criador do jogador (é definida a posição, a velocidade, a cor, largura e altura no main)
    Snake(PVector pos, PVector vel, color col, int s_width, int s_height, Food f, InputManager im)
    {
        position = pos;
        velocity = vel;
        colour = col;
        snake_width = s_width;
        snake_height = s_height;
        food = f;
        input = im;

        lastPosition = position.copy();
        tail = new Tail(); // inicialização da cauda
    }

    //desenha a snake
    private void draw_snake()
    {
        pushStyle();

        fill(colour);
        noStroke();
        rectMode(CENTER);
        rect(position.x, position.y, snake_width, snake_height, 5);

        popStyle();

        tail.draw(snake_width, snake_height, colour); // Desenhar a tail
    }

    // atualização da cobra
    void update()
    {
        lastPosition = position.copy();
        update_snake();
    }

    //mexe o jogador dependendo da tecla apertada 
    private void update_snake()
    {
        if (input.up) position.y -= velocity.y;
        else if (input.down) position.y += velocity.y;
        else if (input.left) position.x -= velocity.x;
        else if (input.right) position.x += velocity.x;
    }
    //verifica a colisão com a comida
    //Retorna true se comer a comida
    boolean collision()
    {
        if (position.x + snake_width/2 >= food.position.x - food.radius && position.x - snake_width/2 <= food.position.x + food.radius && position.y + snake_height/2 >= food.position.y - food.radius && position.y - snake_height/2 <= food.position.y + food.radius)
        {
            tail.grow(); //aumenta a cauda
            food.refresh(PixelSize); //uma nova comida é gerada
            return true; //colisdiu com a comida
        }   
        return false; //se nao houver colisão
    }
    
    //verifica a colisão com os limites do ecra
    boolean hitWall(int PixelSize)
    {
        return position.x < PixelSize ||
            position.x >= width - PixelSize ||
            position.y < PixelSize ||
            position.y < PixelSize;
    }

    //verifica a colisão com a tail
    boolean hitTail()
    {
        return tail.checkCollision(position, snake_width);
    }
    //faz reset a posiçao inicial apos colidir
    void resetPosition()
    {
        position = new PVector(width/2, height/2); //posiçao inicial
        tail.segments.clear(); //reset a cauda
        velocity = new PVector(20, 20); //mantem a velocidade
    }
}
