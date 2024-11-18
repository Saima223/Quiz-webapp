<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Quiz Web</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
      
</head>
<body> 
    <div class="container">
        <header>
            <nav class="navbar home-nav navbar-expand-lg navbar-dark" style="background-color: #800080;">
                <a class="navbar-brand home-nav-brand" href="admin/login.jsp">QuizWeb</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse home-nav-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto home-navbar-nav">
                        <li class="nav-item active home-nav-item">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item home-nav-item">
                            <a class="nav-link" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item home-nav-item">
                            <a class="nav-link" href="contact.jsp">Contact</a>
                        </li>
                    </ul>
                    <div class="d-grid gap-3 d-md-flex justify-content-md-end" style="display: flex; gap: 25px;">
                    <a href="login.jsp"><button class="btn btn-light me-md-2" type="button">Login</button></a>
                    <a href="registration.jsp"><button class="btn btn-primary" type="button">Registration</button></a>
                </div>
                </div>
            </nav>
        </header>
        <main class="d-flex justify-content-center align-items-center text-center" style="margin-top: 100px;">
    <div class="media-body animated-text">
        <h3 class="animate__animated animate__fadeIn">Welcome to Quiz Web!</h3>
        <h5 class="mt-0 mb-1">Test Your Knowledge, Win Rewards!</h5>
        <p>Ready for a challenge? Play daily quizzes,<br>and boost your knowledge !</p>
                <a href="registration.jsp" class="btn btn-primary btn-custom">Join Now - Start Playing!</a>
        
    </div>
</main>
        
    </div>
    <jsp:include page="footer.jsp" />

    </body>
</html>
