//Cria a particula individual

class Particle
{
    float pos_x;
    float pos_y;
    float velocity_x;
    float velocity_y;

    float life = 255; //255 é visivel | 0 é invisivel
    color col;

    //Construtor
    Particle(float pos_x, float pos_y, float velocity_x, float velocity_y, color col)
    {
        this.pos_x = pos_x;
        this.pos_y = pos_y;
        this.velocity_x = velocity_x;
        this.velocity_y = velocity_y;
        this.col = col;
        
    }

    void update()
    {   
        //adicionar a velocidade à posição
        pos_x = pos_x + velocity_x;
        pos_y = pos_y + velocity_y;

        life = life - 10; // pede transparencia a cada frame (FrameRate = 10)

    }

    void draw()
    {
        pushStyle();
        noStroke();
        fill(col, life);
        rect(pos_x, pos_y, 4, 4);
        popStyle();
    }

    //Função para que o ParticleSystem saiba quando eliminar a particula
    boolean isDead() 
    {
        return life <= 0;
    }
}