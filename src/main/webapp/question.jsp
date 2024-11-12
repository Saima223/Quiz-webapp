<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="testing.model.QuizQuestion" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Questions</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Quiz Questions</h1>

    <%
    List<QuizQuestion> questions = (List<QuizQuestion>) request.getAttribute("questions");
    String quizId = (String) request.getAttribute("quizId");  // Get from request
    if (quizId == null) {
        // Backup: try getting from session
        quizId = (String) session.getAttribute("currentQuizId");
    }

    if (questions != null && !questions.isEmpty()) {
    %>
    <form action="submitQuiz" method="post">
        <%-- Use the quizId we got above --%>
        <input type="hidden" name="quizId" value="<%= quizId %>">
        
        <%
        for (QuizQuestion question : questions) {
        %>
        <div class="question">
            <p><%= question.getQuestionText() %></p>
            <input type="radio" name="question_<%= question.getQuestionId() %>" value="1" id="q<%= question.getQuestionId() %>_1" required>
            <label for="q<%= question.getQuestionId() %>_1"><%= question.getOption1() %></label><br>

            <input type="radio" name="question_<%= question.getQuestionId() %>" value="2" id="q<%= question.getQuestionId() %>_2">
            <label for="q<%= question.getQuestionId() %>_2"><%= question.getOption2() %></label><br>

            <input type="radio" name="question_<%= question.getQuestionId() %>" value="3" id="q<%= question.getQuestionId() %>_3">
            <label for="q<%= question.getQuestionId() %>_3"><%= question.getOption3() %></label><br>

            <input type="radio" name="question_<%= question.getQuestionId() %>" value="4" id="q<%= question.getQuestionId() %>_4">
            <label for="q<%= question.getQuestionId() %>_4"><%= question.getOption4() %></label><br>
        </div>
        <hr>
        <%
        }
        %>
        <input type="submit" value="Submit Quiz">
    </form>
    <%
    } else {
    %>
    <p>No questions available for this quiz.</p>
    <%
    }
    %>
</body>
</html>