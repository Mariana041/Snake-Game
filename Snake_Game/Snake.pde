class Snake // Classe do jogador
{
    Food food;
    Tail tail;

    PVector position, velocity;
    int snake_width, snake_height;
    color colour;

    //Criador do jogador (é definida a posição, a velocidade, a cor, largura e altura no main)
    Snake(PVector pos, PVector vel, color col, int s_width, int s_height)
    {
        position = pos;
        velocity = vel;
        colour = col;
        snake_width = s_width;
        snake_height = s_height;

        tail = new Tail(); // inicialização da cauda
    }

    //desenha o jogador
    private void draw_snake()
    {
        pushStyle();

        fill(colour);
        rectMode(CENTER);
        rect(position.x, position.y, snake_width, snake_height, 5);

        popStyle();

        tail.draw(snake_width, snake_height, colour);
    }

    // atualização da cobra
    void update()
    {
        update_player();
        tail.update(position.copy());
    }

    //mexe o jogador dependendo da tecla apertada ()
    private void update_snake()
    {
        if (InputManager.up)
        {
            position.y -= velocity.y;
        } 
        else if (InputManager.down)
        {
            position.y += velocity.y;
        } 
        else if (InputManager.left)
        {
            position.x -= velocity.x;
        } 
        else if (InputManager.right)
        {
            position.x += velocity.x;
        }
    }

    //Após comer a comida
    void grow()
    {
        tail.grow();
    }

    //verifica a colisão com a comida
    void collision()
    {
        if (position.x + snake_width/2 >= food.position.x - food.radius &&
            position.x - snake_width/2 <= food.position.x + food.radius &&
            position.y + snake_height/2 >= food.position.y - food.radius &&
            position.y - snake_height/2 <= food.position.y + food.radius)
        {
            tail.grow(); //crescimento da tail
            food.refresh(); // nova comida
            score += 1;  // incrementa a pontuação
        }
    }
    
    //verifica a colisão com os limites do ecra
    boolean hitWall()
    {
        return position.x - snake_width/2 < 0 ||
            position.x + snake_width/2 > width ||
            position.y - snake_height/2 < 0 ||
            position.y + snake_height/2 > height;
    }

    //verifica a colisão com a tail
    boolean hitTail()
    {
        return tail.checkCollision(position, snake_width);
    }
}
