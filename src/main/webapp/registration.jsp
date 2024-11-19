<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome for icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/login&registration.css">

</head>

<body>
  <div class="container">
    <h2>Register</h2>

    <!-- Error message handling using plain JSP -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
      <div class="alert alert-danger">
        <%= errorMessage %>
      </div>
    <%
        }
    %>

    <!-- Registration Form -->
    <form action="registerr" method="POST" id="registerForm" class="needs-validation" novalidate>
      
      <!-- Admission Number -->
      <div class="mb-3">
        <label for="admissionNumber" class="form-label">Admission Number</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-id-card"></i></span>
          <input type="text" name="anumber" class="form-control" id="admissionNumber" placeholder="Enter your admission number" required>
        </div>
        <div class="invalid-feedback">Please enter your admission number.</div>
      </div>

      <!-- Full Name -->
      <div class="mb-3">
        <label for="registerName" class="form-label">Full Name</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-user"></i></span>
          <input type="text" name="fname" class="form-control" id="registerName" placeholder="Enter your full name" required>
        </div>
        <div class="invalid-feedback">Please enter your full name.</div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="registerEmail" class="form-label">Email</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-envelope"></i></span>
          <input type="email" name="email" class="form-control" id="registerEmail" placeholder="Enter your email" required>
        </div>
        <div class="invalid-feedback">Please enter a valid email.</div>
      </div>

      <!-- Password -->
      <div class="mb-3">
        <label for="registerPassword" class="form-label">Password</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-lock"></i></span>
          <input type="password" name="pswd" class="form-control" id="registerPassword" placeholder="Create a password" required>
        </div>
        <div class="invalid-feedback">Please enter a password.</div>
      </div>

      <!-- Phone Number -->
      <div class="mb-3">
        <label for="registerPhone" class="form-label">Phone Number</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-phone"></i></span>
          <input type="tel" name="pnumber" class="form-control" id="registerPhone" placeholder="Enter your phone number" required>
        </div>
        <div class="invalid-feedback">Please enter your phone number.</div>
      </div>

      <!-- Submit Button -->
      <button type="submit" class="btn btn-custom w-100">Register</button>
      
      <!-- Link to Login Page if User Already Has an Account -->
      <div class="text-center mt-3">
        <p>You already have an account? <a href="login.jsp" class="toggle-link">Login Here</a></p>
      </div>
    </form>
  </div>

  <!-- Bootstrap JS and form toggle functionality -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
  
  <script src="./js/registration.js"></script>

</body>

</html>