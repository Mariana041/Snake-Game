// ArrayList dos elementos do corpo 
// crescimento da snake
// colisão com o corpo 

class Tail
{
    // ArrayList da tail
    ArrayList<PVector> segments;

    Tail()
    {
        segments = new ArrayList<PVector>();
    }

    // atualiza a cauda com base na posição da cabeça
    void update(PVector headPosition)
    {
        if (segments.size() > 0)
        {
            segments.add(0, headPosition);
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
        if (segments.size() == 0) segments.add(new PVector(0, 0));
        else segments.add(segments.get(segments.size() - 1).copy());
    }

  // verifica colisão da cabeça com a tail
    boolean checkCollision(PVector headPos, int size)
    {
        for (int i = 0; i < segments.size(); i++)
        {
            PVector pos = segments.get(i);

            if (headPos.x + size/2 >= pos.x - size/2 &&
                headPos.x - size/2 <= pos.x + size/2 &&
                headPos.y + size/2 >= pos.y - size/2 &&
                headPos.y - size/2 <= pos.y + size/2)
            {
                return true;
            }
        }
        return false;
    }
}