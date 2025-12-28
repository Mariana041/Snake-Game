//controla o ciclo de vida da particula
// criar a quantidade de particulas necessarias para o efeito 

class ParticleSystem
{
    ArrayList<Particle> particles; //Armazenamento das particulas 

    ParticleSystem()
    {
        particles = new ArrayList<Particle>();

    }

    void explosion(float x, float y, color col, int amount)
    {
        for(int i = 0; i < amount; i++)
        {
            //velocidade aleatoria para cada particula 
            float velocity_x = random(-3,3);
            float velocity_y = random(-3,3);

            //Adicionar uma particula a lista 
            particles.add(new Particle(x, y, velocity_x, velocity_y, col));
        }
    }
    void update()
    {
        for (int i = particles.size() - 1; i >= 0; i--)
        {
            Particle p = particles.get(i);
            p.update();
            p.draw();

            if (p.isDead()) particles.remove(i); //se a particula tiver life <= 0 então é removida da lista 
        }
    }
}