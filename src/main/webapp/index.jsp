<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catch the Ball Game</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f3f4f6;
            font-family: Arial, sans-serif;
        }
        #gameArea {
            position: relative;
            width: 300px;
            height: 400px;
            background-color: #ddd;
            overflow: hidden;
            border: 2px solid #333;
        }
        #paddle {
            position: absolute;
            bottom: 0;
            width: 60px;
            height: 10px;
            background-color: #333;
        }
        #ball {
            position: absolute;
            top: 0;
            width: 20px;
            height: 20px;
            background-color: #f00;
            border-radius: 50%;
        }
        #score {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <div id="gameArea">
        <div id="score">Score: 0</div>
        <div id="paddle"></div>
        <div id="ball"></div>
    </div>

    <script>
        const gameArea = document.getElementById("gameArea");
        const paddle = document.getElementById("paddle");
        const ball = document.getElementById("ball");
        const scoreDisplay = document.getElementById("score");

        let score = 0;
        let ballX = Math.floor(Math.random() * 280); // Random start position for the ball
        let ballY = 0;
        let ballSpeed = 2;
        let paddleX = 120; // Initial paddle position
        const paddleSpeed = 20;

        // Update paddle position
        document.addEventListener("keydown", (e) => {
            if (e.key === "ArrowLeft" && paddleX > 0) {
                paddleX -= paddleSpeed;
            } else if (e.key === "ArrowRight" && paddleX < 240) {
                paddleX += paddleSpeed;
            }
            paddle.style.left = paddleX + "px";
        });

        // Game loop
        function gameLoop() {
            // Move the ball down
            ballY += ballSpeed;
            ball.style.top = ballY + "px";
            ball.style.left = ballX + "px";

            // Check if the ball hits the paddle
            if (ballY >= 380 && ballX >= paddleX && ballX <= paddleX + 60) {
                score++;
                scoreDisplay.textContent = "Score: " + score;
                resetBall();
            }

            // Check if the ball misses the paddle
            if (ballY > 400) {
                alert("Game Over! Final Score: " + score);
                score = 0;
                scoreDisplay.textContent = "Score: 0";
                resetBall();
            }

            requestAnimationFrame(gameLoop);
        }

        // Reset ball position
        function resetBall() {
            ballX = Math.floor(Math.random() * 280);
            ballY = 0;
            ballSpeed = 2 + score * 0.5; // Increase speed as score increases
        }

        // Start the game
        gameLoop();
    </script>
</body>
</html>
