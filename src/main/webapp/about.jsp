<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Web - About</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"  href="css/style.css"> 
     <link rel="icon" href="images/3545917.webp">
    <style>
       
       
    </style>
</head>
<body>
<div class="container">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark mt-2">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin/login.jsp">QuizWeb</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="login.jsp"><button class="btn btn-light me-md-2" type="button">Login</button></a>
                    <a href="registration.jsp"><button class="btn btn-primary" type="button">Registration</button></a>
                </div>
            </div>
        </div>
    </nav>
</header>

<div class="text-container mt-4 text-center animated-text">
    <h2>ABOUT US</h2> 
</div>

<div class="about-container">
    <div class="row ">
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm hover-shadow-lg" style="transition: transform 0.3s;">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Discover, Learn, Enjoy!</h4>
                    <p class="card-text">Dive into a world of engaging quizzes that make learning fun. Test your knowledge, challenge yourself, and explore new topics—Quiz Web makes learning interactive and exciting!</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm hover-shadow-lg" style="transition: transform 0.3s;">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Our Mission</h4>
                    <p class="card-text">We aim to make knowledge accessible to everyone in an exciting way. Our quizzes are designed to inspire curiosity and creativity, making learning enjoyable for all ages!</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm hover-shadow-lg" style="transition: transform 0.3s;">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Why Quiz Web?</h4>
                    <p class="card-text">With interactive quizzes across diverse categories, Quiz Web brings you a platform that makes learning a fun challenge. Discover new topics, improve your skills, and enjoy the process!</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm hover-shadow-lg" style="transition: transform 0.3s;">
                <div class="card-body">
                    <h4 class="card-title fw-bold">Join the Fun!</h4>
                    <p class="card-text">Ready to challenge your mind and have fun? Join our community of curious learners and start discovering new quizzes today. Everyone is welcome—whether you're a beginner or a pro!</p>
                </div>
            </div>
        </div>
    </div>
</div>
   <footer class="text-center">
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
          <a href="https://github.com/ibadbargir" style="color: white;"><span>Ibad</span></a>  |
          <a href="https://github.com/Saima223"  style="color: white;"><span>Saima</span></a> | 
          <a href="https://github.com/Rabina-Vishwakarma"  style="color: white;"><span>Rabina</span></a> | 
          <a href="https://github.com/SakshiArvindYadav"  style="color: white;"><span>Sakshi</span></a>
          </div> 
        </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
