<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Results</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Quiz Results</h1>
        <div class="result-card">
            <h2>Your Score</h2>
            
            <p class="score">
                <%= request.getAttribute("score") %> out of <%= request.getAttribute("totalQuestions") %>
                <span class="percentage">(<%= String.format("%.1f", (Double) request.getAttribute("percentage")) %>%)</span>
            </p>

            <!-- Displaying score, total questions, and percentage -->
            <p>Score: <%= request.getAttribute("score") %></p>
            <p>Total Questions: <%= request.getAttribute("totalQuestions") %></p>
            <p>Percentage: <%= request.getAttribute("percentage") %></p>
            
            <% 
            Double percentage = (Double) request.getAttribute("percentage");  // Safely cast to Double
            if (percentage != null) {  // Ensure the percentage is not null
                if (percentage >= 80) { 
            %>
                    <p class="feedback">Excellent work! You've mastered this topic!</p>
            <% 
                } else if (percentage >= 60) { 
            %>
                    <p class="feedback">Good job! Keep practicing to improve further.</p>
            <% 
                } else { 
            %>
                    <p class="feedback">You might want to review this topic again.</p>
            <% 
                }
            } else {
            %>
                <p class="feedback">An error occurred while calculating your percentage.</p>
            <% 
            }
            %>
        </div>
        
        <!-- Links for further actions -->
        <div class="actions">
            <!-- Link to return to quiz list -->
            <a href="<%= request.getContextPath() %>/quizList" class="button">Return to Quiz List</a>
            
            <!-- Link to review the quiz answers -->
            <a href="<%= request.getContextPath() %>/reviewQuiz?id=<%= request.getParameter("quizId") %>" class="button">Review Answers</a>
        </div>
        
    </div>
</body>
</html>
