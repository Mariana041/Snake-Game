class Game
{
    boolean inMenu = true; //verificar se esta no ecra inicial
    boolean gameOver = false; //verificar se o jogo terminou
    int score = 0; //pontuaçao inicial
    int highScore = 0; //pontuação final de jogo
    int lives = 3; //sistema de vidas

    //verificvar o inicio do jogo
    void startGame() 
    {
        println("comecou o jogo");
        inMenu = false;
        gameOver = false;
        
        score = 0;
        lives = 3; //valor de vidas no inicio do jogo 
    }

    //sistema de vidas
    void loseLife() 
    {
        lives--; // Perde uma vida
        println("perdeu 1 vida \n numero de vidas", lives);
        if (lives <= 0) 
        {
            endGame(); //aparece o game over se não houver mais vidas
            println("Perdeu");
        }

    }

    //verificar o fim do jogo
    void endGame() 
    {
        gameOver = true;
        println("Fim do jogo");
        
        
    }

    //reiniciar o jogo
    void reset() 
    {
        gameOver = false;
        score = 0;
        lives = 3;
        
        
    }

}