<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact - QuizWeb</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"  href="css/style.css"> 
    <link rel="icon" href="images/3545917.webp">
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
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="contact.jsp">Contact</a>
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

<main class="contact-container contact-info">
    <h1 class="text-center">Get in Touch!</h1>
    <p class="text-center">We'd love to hear from you. Please fill out the form below or visit us at our location.</p>

    <div class="row">
        <div class="col-md-6">
            <h2>Contact Form</h2>
            <div class="contact-form">
                <form method="post" action="contact">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Send Message</button>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <h2>Our Location</h2>
            <div class="map-container card">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345094004!2d144.95373531531834!3d-37.81627997975178!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0b1f4d3f%3A0x5045675218ceed30!2sVictoria!5e0!3m2!1sen!2sau!4v1633545696912!5m2!1sen!2sau" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>

</main>


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

<!-- Bootstrap JS & FontAwesome -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js"></script>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMjxj+6F0f5nHf5POh6Pb9d8pQ83OaF8C1Dg1B" crossorigin="anonymous"></script>
</body>
</html>
