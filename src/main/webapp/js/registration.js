// Generate a random admission number for the registration form
  function generateAdmissionNumber() {
    const letter = String.fromCharCode(65 + Math.floor(Math.random() * 26));
    const number = Math.floor(1000 + Math.random() * 9000);
    document.getElementById('admissionNumber').value = letter + number;
  }
  window.onload = generateAdmissionNumber;

  // Bootstrap validation
  (function () {
    'use strict'
    const forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })();
  
  
  // login js
  
  document.addEventListener('DOMContentLoaded', function () {
      const loginForm = document.getElementById('loginForm');
      if (loginForm) {
        loginForm.addEventListener('submit', function (event) {
          event.preventDefault();  // Prevent the form from submitting until validation is successful

          // Fetch email and password
          const email = document.getElementById('loginEmail').value;
          const password = document.getElementById('loginPassword').value;

          // Check if email and password are filled
          if (email && password) {
            // Trigger the modal popup for successful login
            const myModal = new bootstrap.Modal(document.getElementById('loginSuccessModal'), {
              keyboard: false
            });
            myModal.show();
          } else {
            alert("Please enter both email and password.");
          }
        });
      }
    });

    // Function to handle redirect when button in modal is clicked
    function redirectToQuizList() {
      window.location.href = 'main.jsp'; // Replace with your quiz list page URL
    }

    // Optional: Redirect after modal is hidden (if you want redirection after modal close)
    var myModal = document.getElementById('loginSuccessModal');
    myModal.addEventListener('hidden.bs.modal', function () {
      // Automatically redirect to quiz page after the modal is closed
      window.location.href = 'main.jsp'; // Change to your actual quiz list page URL
    });