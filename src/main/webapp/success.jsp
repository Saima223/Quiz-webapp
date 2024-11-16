<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Web - Success Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <link rel="stylesheet" href="css/suceess&Error.css">
</head>
<body>
    <div class="container text-center">
        <div class="success-box box">
            <div class="emoji">😊</div> 
            <h4>Registration Successful!</h4>
            <p>Thank you for registering, <strong><%= request.getAttribute("fname") %></strong>!</p>
           
            <div class="countdown" id="countdown">Redirecting in <span id="time">5</span> seconds...</div>
            <a href="login.jsp" id="continue-button" style="display:none;">
                <button class="btn btn-light mt-3">Continue to Login</button>
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="js/script.js"> </script>
     
   
</body>
</html>
