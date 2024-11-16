<!DOCTYPE html>
<html>
<head>
    <title>Quiz Questions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #1a1f2c 0%, #2d3754 100%);
            min-height: 100vh;
            color: white;
            padding-top: 60px;
            padding-bottom: 80px;
        }

        .navbar {
            background: rgba(0, 0, 0, 0.2) !important;
            backdrop-filter: blur(10px);
        }

        .container {
            max-width: 800px;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            border: none;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            margin-bottom: 2rem;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            color: white;
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .question-number {
            color: #fff;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 1rem;
        }

        .question-text {
            color: #fff;
            font-size: 1.25rem;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-check {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .form-check:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(5px);
        }

        .form-check-input {
            margin-top: 0.3rem;
        }

        .form-check-label {
            color: #fff;
            margin-left: 0.5rem;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(45deg, #4e54c8, #8f94fb);
            border: none;
            padding: 0.8rem 2.5rem;
            border-radius: 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(78, 84, 200, 0.3);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(78, 84, 200, 0.4);
        }

        footer {
            background: rgba(0, 0, 0, 0.2) !important;
            backdrop-filter: blur(10px);
        }

        /* Animation for cards */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>
<body>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
    <%@ page import="testing.model.QuizQuestion" %>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Quiz Web</a>
        </div>
    </nav>

    <div class="container my-5">
        <%
        List<QuizQuestion> questions = (List<QuizQuestion>) request.getAttribute("questions");
        String quizId = (String) request.getAttribute("quizId");
        if (quizId == null) {
            quizId = (String) session.getAttribute("currentQuizId");
        }

        if (questions != null && !questions.isEmpty()) {
        %>
        <form action="submitQuiz" method="post">
            <input type="hidden" name="quizId" value="<%= quizId %>">

            <%
            int questionNumber = 1;
            for (QuizQuestion question : questions) {
            %>
            <div class="card">
                <div class="question-number">Question <%= questionNumber %></div>
                <div class="question-text"><%= question.getQuestionText() %></div>
                
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question_<%= question.getQuestionId() %>" 
                           id="q<%= question.getQuestionId() %>_1" value="1" required>
                    <label class="form-check-label" for="q<%= question.getQuestionId() %>_1">
                        <%= question.getOption1() %>
                    </label>
                </div>
                
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question_<%= question.getQuestionId() %>" 
                           id="q<%= question.getQuestionId() %>_2" value="2">
                    <label class="form-check-label" for="q<%= question.getQuestionId() %>_2">
                        <%= question.getOption2() %>
                    </label>
                </div>
                
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question_<%= question.getQuestionId() %>" 
                           id="q<%= question.getQuestionId() %>_3" value="3">
                    <label class="form-check-label" for="q<%= question.getQuestionId() %>_3">
                        <%= question.getOption3() %>
                    </label>
                </div>
                
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question_<%= question.getQuestionId() %>" 
                           id="q<%= question.getQuestionId() %>_4" value="4">
                    <label class="form-check-label" for="q<%= question.getQuestionId() %>_4">
                        <%= question.getOption4() %>
                    </label>
                </div>
            </div>
            <%
            questionNumber++;
            }
            %>
            
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary">Submit Quiz</button>
            </div>
        </form>
        <%
        } else {
        %>
        <div class="card">
            <div class="card-body text-center">
                <p>No questions available for this quiz.</p>
            </div>
        </div>
        <%
        }
        %>
    </div>

    <footer class="py-3 fixed-bottom">
        <div class="container text-center">
            &copy; 2024 Quiz Web. All rights reserved.
        </div>
    </footer>
</body>
</html>