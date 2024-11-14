<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quizweb-Result</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="icon" href="./images/3545917.webp">
    <link rel="stylesheet" href="./css/styles.css">
</head>
<body>
    <!-- Overlay -->
    <div class="overlay"></div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin/login.jsp">QuizWeb</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <p class="text-end text-white fs-6">Hello, <strong><%= request.getAttribute("fname") %></strong></p>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Result Section -->
    <div class="container text-center mt-5">
        <!-- Category Box -->
        <div class="category-box animate__animated animate__fadeIn">
            <p>Category: <%= request.getAttribute("category") %></p>
        </div>

        <!-- Obtained Box with Marks -->
        <div class="obtained-box animate__animated animate__fadeIn">
            <p>You answered</p>
            <div class="marks-box">
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
            <p>Questions Correct!</p>
        </div>

        <!-- Result Text -->
        <div class="result-text animate__animated animate__fadeIn">
            <%
                if (score != null && totalQuestions != null) {
                    if (score == totalQuestions) {
                        out.print("<p>Good job ! Your Work is very good.</p>");
                    } else if (score >= totalQuestions * 0.7) {
                        out.print("<p>Well done! Keep up the good work!</p>");
                    } else if (score >= totalQuestions * 0.5) {
                        out.print("<p>Nice try! Room for improvement.</p>");
                    } else {
                        out.print("<p>Keep practicing! You'll do better next time.</p>");
                    }
                }
            %>
        </div>

        <!-- Buttons -->
        <div class="button">
			<a href="quizList"><button type="button" class="btn btn-primary">Back to Home</button></a>
			<a href="quizQuestion?quizId=<%= request.getAttribute("quizId") %>"><button type="button" class="btn btn-primary">Play Again</button></a>
		</div>
    </div>

    <footer class="text-center ">
        <div class="social-icon">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-facebook"></i></a>
        </div>
        &copy; 2024 QuizWeb. All rights reserved.
        <div class="footer-name">
            Developed & designed by<br>
            <span class="footer-name-item ">
                <a href="https://github.com/ibadbargir" style="color: white;"><span>Ibad</span></a> |
                <a href="https://github.com/Saima223" style="color: white;"><span>Saima</span></a> |
                <a href="https://github.com/Rabina-Vishwakarma" style="color: white;"><span>Rabina</span></a> |
                <a href="https://github.com/SakshiArvindYadav" style="color: white;"><span>Sakshi</span></a>
            </span>
        </div>
    </footer>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>