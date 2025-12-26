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
        inMenu = false;
        gameOver = false;
        score = 0;
        lives = 3; //valor de vidas no inicio do jogo 
    }

    //sistema de vidas
    void loseLife() 
    {
        lives--; // Perde uma vida
        if (lives <= 0) endGame(); //aparece o game over se não houver mais vidas

    }

    //verificar o fim do jogo
    void endGame() 
    {
        gameOver = true;
        if (score > highScore) highScore = score;
        
    }

    //reiniciar o jogo
    void reset() 
    {
        gameOver = false;
        score = 0;
        lives = 3;
        
    }

}