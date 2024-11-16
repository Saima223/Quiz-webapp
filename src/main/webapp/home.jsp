<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Quiz Web</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
      
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
        
        <div class="home-icon text-light">
           <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-facebook"></i></a>
            </font>
        </div>
        <footer class="text-center">
            &copy; 2024 QuizWeb. All rights reserved.
              <div class="footer-name">
           Developed & designed by<br>
          <span class="footer-name-item ">
          <a href="https://github.com/ibadbargir" style="color: white;"><span>Ibad</span></a>  |
          <a href="https://github.com/Saima223"  style="color: white;"><span>Saima</span></a> | 
          <a href="https://github.com/Rabina-Vishwakarma"  style="color: white;"><span>Rabina</span></a> | 
          <a href="https://github.com/SakshiArvindYadav"  style="color: white;"><span>Sakshi</span></a>
          </div> 
      
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
