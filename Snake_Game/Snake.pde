class Snake // Classe do jogador
{
    //Referências
    Food food;
    Tail tail;
    InputManager input;

    PVector position, velocity;
    int snake_width, snake_height; //dimensões
    color colour;
    PVector lastPosition; //guarda a ultima posição 
    PVector direction;

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

        tail = new Tail(); // inicialização da cauda
        direction = new PVector(1, 0); //para se movimentar para a direita sozinha, velocidade contínua 
    }

    //desenha a cobra
    private void draw_snake()
    {
        pushStyle();

        fill(colour);
        noStroke();
        rectMode(CENTER);
        rect(position.x, position.y, snake_width, snake_height, 5);

        popStyle();
    

        tail.draw(snake_width, snake_height, tail.col); // Desenhar a tail
    }

    // atualização da cobra guardando a posição anterior 
    void update()
    {
        lastPosition = position.copy(); //onde a cobra está agora é igual a posição onde a cobra estava antes 
        update_snake();
    }

    //mexe o jogador dependendo da tecla apertada 
   /* private void update_snake()
    {
        if (input.up) position.y -= velocity.y;
        else if (input.down) position.y += velocity.y;
        else if (input.left) position.x -= velocity.x;
        else if (input.right) position.x += velocity.x;
    }*/

    private void update_snake() //constantemente em movimento
    {
        // mudar direção (Cima, Baixo, Esquerda, Direita)
        if (input.up && direction.y == 0) direction = new PVector(0, -1);
        
        else if (input.down && direction.y == 0) direction = new PVector(0, 1);
        else if (input.left && direction.x == 0) direction = new PVector(-1, 0);
        else if (input.right && direction.x == 0) direction = new PVector(1, 0);
        
        // mover de forma constante 
        position.x += direction.x * velocity.x;
        position.y += direction.y * velocity.y;
    }

 
    //verifica a colisão com a comida
    //se sim então chama a função tail.grow()
    boolean collision()
    {
        //lado esquerdo, direito, cima, baixo
        if (position.x + snake_width/2 >= food.position.x - food.radius && position.x - snake_width/2 <= food.position.x + food.radius && position.y + snake_height/2 >= food.position.y - food.radius && position.y - snake_height/2 <= food.position.y + food.radius)
        {
            tail.grow(); //aumenta a cauda
            food.refresh(PixelSize); //uma nova comida é gerada
            return true; //colidiu com a comida
        }   
        return false; //se nao houver colisão 

    }   

    
    //verifica a colisão com os limites do ecra (Nada aconteceu)
    boolean hitWall(int PixelSize)
    {
        // parede esquerda || parede direita || parede superior || parede inferior 
        return position.x - snake_width/2 < PixelSize || 
        position.x + snake_width/2 >= width - PixelSize || 
        position.y - snake_height/2 < PixelSize || 
        position.y + snake_height/2 >= height - PixelSize;
    }

    //verifica a colisão com a tail
    boolean hitTail()
    {
        return tail.checkCollision(position, snake_width);
    }
    
    //faz reset a posiçao inicial apos colidir, limpa os segmentos da cauda e mantem a velocida 
    void resetPosition()
    {
        position = new PVector(width/2, height/2); //posiçao inicial
        tail.segments.clear(); //reset a cauda
        velocity = new PVector(20, 20); //mantem a velocidade
    }
}
