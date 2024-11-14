// Success Page Script
let countdownTime = 5;
const countdownElement = document.getElementById('time');
const continueButton = document.getElementById('continue-button');

if (countdownElement && continueButton) {
  const countdownInterval = setInterval(() => {
      countdownTime--;
      countdownElement.textContent = countdownTime;

      if (countdownTime <= 0) {
          clearInterval(countdownInterval);
          continueButton.style.display = 'block';
          window.location.href = 'login.jsp';
      }
  }, 1000);
}

// Main page Script
let selectedCardId = null;  // Track the ID of the currently selected card

function handleImageClick(imageId, language) {
    const image = document.getElementById(imageId);
    image.style.boxShadow = '10px 20px 30px lightblue';
    image.style.backgroundColor = 'blue'; // Blue background for clicked image

    // Show the "Start Quiz" button
    document.getElementById('navigateButton').style.display = 'inline-block';

    // Show an alert message with the selected language
    
}

// Reset all cards and hide the "Start Quiz" button
function resetCards() {
    document.querySelectorAll('.interactiveImage').forEach(function (cardElement) {
        // Reset card styles
        cardElement.style.boxShadow = '';  // Remove the box-shadow
        cardElement.style.backgroundColor = '';  // Remove the background color
    });

    // Hide the "Start Quiz" button when resetting
    document.getElementById('navigateButton').style.display = 'none';

    // Reset the selectedCardId
    selectedCardId = null;
}

// Add event listeners to each image (card)
document.querySelectorAll('.interactiveImage').forEach(function (cardElement) {
    cardElement.addEventListener('click', function () {
        const imageId = cardElement.id;
        const language = cardElement.querySelector('.card-title').innerText;

        // Check if a card is already selected and if the clicked card is different
        if (selectedCardId && selectedCardId !== imageId) {
            alert('You have already clicked on one card. You can play only one quiz at a time.');
            return;
        }

        // If no card is selected or the same card is clicked, proceed
        resetCards();  // Reset other cards first
        selectedCardId = imageId;  // Set the selected card's ID
        handleImageClick(imageId, language);  // Apply styles and show alert
    });
});

// Add event listener for navigateButton separately
document.getElementById('navigateButton').addEventListener('click', function () {
    window.location.href = '../quizpage.jsp'; // Redirect to quiz page
});

// login page script


