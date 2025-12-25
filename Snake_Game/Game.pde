// estado do jogo
// nº vidas
// score
// união entre as classes snake, food e particleSystem

class Game
{
boolean inMenu = true;
    boolean gameOver = false;
    int score = 0;
    int highScore = 0;

    void startGame() {
        inMenu = false;
        gameOver = false;
        score = 0;
    }

    void endGame() {
        gameOver = true;
        if (score > highScore) {
            highScore = score;
            // Aqui você pode salvar em arquivo, ex.: saveStrings("highscore.txt", new String[]{str(highScore)});
        }
    }

    void reset() {
        gameOver = false;
        score = 0;
        // Reinicialize Snake e Food aqui
    }

    void drawMenu() {
        fill(255);
        textSize(40);
        textAlign(CENTER);
        text("Snake Game", width/2, height/2 - 50);
        textSize(20);
        text("Use arrows to move. Press SPACE to start.", width/2, height/2);
        text("High Score: " + highScore, width/2, height/2 + 30);
    }

    void drawGameOver() {
        fill(255, 0, 0);
        textSize(40);
        textAlign(CENTER);
        text("Game Over! Score: " + score, width/2, height/2);
        textSize(20);
        text("Press R to Restart or M for Menu", width/2, height/2 + 50);
    }
}