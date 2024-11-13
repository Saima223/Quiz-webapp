<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Results</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
    <div class="wave-bg"></div>
    
    <!-- Display username -->
    <div class="username">Hello, <%= request.getAttribute("fname") %></div>

    <div class="container">
        <div class="logo">QuizWeb</div>
        
        <!-- Display category -->
        <div class="category">Category: <%= request.getAttribute("category") %> </div>
        
        <div class="result-text">You answered</div>
        
        <div class="score">
            <% 
                Integer score = (Integer) request.getAttribute("score");
                Integer totalQuestions = (Integer) request.getAttribute("totalQuestions");

                if (score == null || totalQuestions == null) {
                    out.print("Error: Could not retrieve quiz results.");
                } else {
                    out.print(score + "/" + totalQuestions);
                }
            %>
        </div>
        
        <div class="correct-text">Questions Correct!</div>
        
        <div class="message">
            <% 
                if (score != null && totalQuestions != null) {
                    if (score == totalQuestions) {
                        out.print("Good job! Your work is very good.");
                    } else if (score >= totalQuestions * 0.7) {
                        out.print("Well done! Keep up the good work!");
                    } else if (score >= totalQuestions * 0.5) {
                        out.print("Nice try! Room for improvement.");
                    } else {
                        out.print("Keep practicing! You'll do better next time.");
                    }
                }
            %>
        </div>
        
        <div class="buttons">
            <a href="quizList" class="button">Back to Home</a>
            <a href="quizQuestion?quizId=<%= request.getAttribute("quizId") %>" class="button">Play Again</a>
        </div>
    </div>

    <footer>
        © 2024 QuizWeb. All rights reserved.<br>
        Developed & designed by<br>
        Saima <3
    </footer>
        
</body>
</html>
