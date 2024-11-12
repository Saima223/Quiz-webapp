<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="testing.model.Quiz" %>

<!DOCTYPE html>
<html>
<head>
    <title>Quizzes</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Available Quizzes</h1>
    <% 
     // Check if user is logged in
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>

    <!-- Display success message if exists -->
    <div class="quiz-container">
        <h2>Welcome to the Quiz</h2>
        
        <%
        // Display success message if exists
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
        %>
            <div class="success-message">
                <%= successMessage %>
            </div>
        <%
            session.removeAttribute("successMessage");
        }
        %>
    </div>

    <%
        // Retrieve quizzes list from the request attribute
        List<Quiz> quizzes = (List<Quiz>) request.getAttribute("quizzes");

        if (quizzes != null && !quizzes.isEmpty()) {
    %>
        <ul>
            <%
                for (Quiz quiz : quizzes) {
            %>
                <li>
                    <h2><%= quiz.getTitle() %></h2>
                    <p><%= quiz.getDescription() %></p>
                    <p>Total Questions: <%= quiz.getTotalQuestions() %></p>
                    <a href="quizQuestion?quizId=<%= quiz.getQuizId() %>">Start Quiz</a>
                </li>
            <%
                }
            %>
        </ul>
    <%
        } else {
    %>
        <p>No quizzes available at the moment.</p>
    <%
        }
    %>
   
   <form action="logout" method="get">
            <button type="submit">Logout</button>
        </form>
    <!-- Link to trigger the /quizList servlet -->
    <div>
        <a href="quizList">Go to Quiz List</a> <!-- This triggers your QuizListController servlet -->
    </div>
 
</body>
</html>
