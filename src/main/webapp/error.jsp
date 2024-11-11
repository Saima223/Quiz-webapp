<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Page Not Found</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
            body {
            height: 100vh; 
            display: flex;
            justify-content: center;
            align-items: center;
            color: white; 
            margin-left:200px;
            padding-left:200px;
            
        }
        
        .error-box {
             max-width: 500px;
            text-align: center;
            padding: 30px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background: linear-gradient(45deg, #25252b, #2337c6);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);    
            
        }
      
         .emoji {
            font-size: 50px; 
            animation: bounce 1s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-20px);
            }
            60% {
                transform: translateY(-10px);
            }
        }
  
    </style>
</head>
<body>
    <div class="container">
        
         <div class="error-box">
            <div class="emoji">😔</div> 
            <h4>Oops! Page Not Found</h4>
           <p class="lead">We're sorry, but the page you were looking for doesn't exist.</p>
            <p>You can return to the homepage </p>
                <a href="home.jsp" class="btn btn-primary">Go to Homepage</a>
        </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
