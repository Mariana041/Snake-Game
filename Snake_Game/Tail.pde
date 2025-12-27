// Lista de posições onde a cauda segue o moviemnto da cabeça (classe snake)


class Tail
{
    // ArrayList da tail - guarda as posições dos segmentos 
    ArrayList<PVector> segments;
    // o numero de segmentos que será acrescentado a cauda apos comer
    int pendingGrowth = 0; 
    color col;

    //Contrutor
    Tail()
    {
        segments = new ArrayList<PVector>(); //cria a lista
        col = color(16, 144, 16); //cor da tail
    
    }
    // atualiza a tail baseada na posição da cabeça (segue a classe snake -> cabeça)
    void update(PVector headPosition)
    {
        segments.add(0, headPosition.copy());

        if (pendingGrowth > 0)
        {
            pendingGrowth--; // cresce → não remove
        }
        else if (segments.size() > 0)
        {
            segments.remove(segments.size() - 1);
        }
    }

  // desenha os segmentos da cauda
    void draw(int w, int h, color col)
    {
        pushStyle();

        fill(col);
        rectMode(CENTER);
        for (int i = 0; i < segments.size(); i++) 
        {
            PVector pos = segments.get(i);
            rect(pos.x, pos.y, w, h, 5);
        }

        popStyle();
    }

  // adiciona um novo segmento à tail após comer
    void grow()
    {
        pendingGrowth++;
    }

  // verifica colisão da cabeça com a tail
    boolean checkCollision(PVector headPos, int size)
    {
        for (int i = 2; i < segments.size(); i++)
        {
            PVector pos = segments.get(i);

            if (headPos.x + size/2 >= pos.x - size/2 && headPos.x - size/2 <= pos.x + size/2 && headPos.y + size/2 >= pos.y - size/2 && headPos.y - size/2 <= pos.y + size/2)
            {
                return true; // colidiu com a cauda
            }
        }
        return false; // nao colidiu com a cauda
    }
}