<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- External CSS for Icons -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/login&registration.css">
</head>
<style>
.text-center p {
color="yellow";
}
.mb-3{
color="blue"
}
</style>
<body>
    <%
        // Display error message if any
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
            out.println("<p style='color: red;'>" + errorMessage + "</p>");
        }
        
        // Display success message if any
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
            out.println("<script>setTimeout(function() { $('#loginSuccessModal').modal('show'); }, 500);</script>");
        }
    %>

    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn btn-custom w-100">Login</button>

            <div class="text-center mt-3">
                <p color="yellow">Don't have an account? <a href="registration.jsp" class="toggle-link">Register here</a></p>
            </div>
        </form>
    </div>

    <!-- Modal HTML -->
    <div class="modal fade" id="loginSuccessModal" tabindex="-1" aria-labelledby="loginSuccessModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginSuccessModalLabel">Login Successful</h5>
                    <button type="button" class="btn-close btn-light text-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Login successful! Welcome, <%= request.getAttribute("fname") %>.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary"><a href="quizList">Go to Quiz List</a></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (for form validation and responsiveness) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Custom JS for login handling and modal -->
    <script src="./js/registration.js"></script>
</body>

</html>