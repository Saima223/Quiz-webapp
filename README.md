# Quiz Web App

A dynamic and interactive Quiz Web Application that allows students to register, log in, and participate in quizzes. The application follows the MVC design pattern and is built using Java Servlet, JSP, and MySQL.

## Features

1. **User Authentication**
   - Secure registration and login system.
   - Automatically generated admission numbers during registration.
   
2. **Quizzes**
   - Students can choose quizzes by category.
   - Choose difficulty levels and random Questions based on user preference. 
   - Displays all questions with options and a "Submit" button.

3. **Results**
   - Displays username, quiz category, and final score.
   - Play again functionality.

4. **Responsive Design** (Work in Progress)
   - Frontend styled using CSS for a user-friendly interface.
   - Fixed navigation bar and footer for consistency.

5. **Database Management**
   - MySQL database integration to store user data, quiz details, and results.

## Technology Stack

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets
- **Database**: MySQL (using XAMPP)
- **IDE**: Eclipse
- **Version Control**: Git

## Project Structure

```
QuizProject/
│
├── src/
│   ├── com/
│   │   ├── quizapp/
│   │   │   ├── controller/
│   │   │   │   ├── RegistrationController.java
│   │   │   │   ├── LoginController.java
│   │   │   │   ├── QuizController.java
│   │   │   │   └── ResultController.java
│   │   │   ├── model/
│   │   │   │   ├── User.java
│   │   │   │   ├── Quiz.java
│   │   │   │   └── Result.java
│   │   │   ├── dao/
│   │   │   │   ├── UserDAO.java
│   │   │   │   ├── QuizDAO.java
│   │   │   │   └── ResultDAO.java
│   │   │   └── utils/
│   │   │       ├── DBConnection.java
│   │   │       └── Constants.java
│   └── web.xml
│
├── WebContent/
│   ├── META-INF/
│   │   └── context.xml
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── register.jsp
│   ├── login.jsp
│   ├── quiz.jsp
│   ├── result.jsp
│   ├── home.jsp
│   ├── registration-success.jsp
│   ├── error.jsp
│   ├── css/
│   │   └── styles.css
│   ├── js/
│   │   └── script.js
│   ├── images/
│   │   └── logo.png
│   └── lib/
│       └── mysql-connector-java.jar
```

## Setup Instructions

### Prerequisites

- Install Java JDK (version 8 or later).
- Install Eclipse IDE.
- Install XAMPP for MySQL and Apache server.
- Download the MySQL Connector JAR file and place it in the `lib` folder.

### Steps to Run the Project

1. Clone the repository to your local machine:
   ```bash
   git clone <https://github.com/Saima223/Quiz-webapp.git>
   ```

2. Import the project into Eclipse:
   - Open Eclipse and select **File > Import > Existing Projects into Workspace**.
   - Browse to the project folder and click **Finish**.

3. Configure the database:
   - Start XAMPP and open phpMyAdmin.
   - Create a database named `quizapp`.
   - Import the `quizapp.sql` file (located in the project root) to set up tables.

4. Update the database connection settings:
   - Open `DBConnection.java` in the `utils` package.
   - Update the database URL, username, and password as per your local configuration.

5. Deploy the application:
   - Right-click the project in Eclipse and select **Run As > Run on Server**.
   - Choose a server (e.g., Apache Tomcat) and start the application.

6. Access the application:
   - Open a browser and go to `http://localhost:8080/QuizProject/`.

## Future Enhancements

- Implement password hashing for secure authentication.
- Make the UI fully responsive for mobile and tablet devices.
- Enhance quiz analytics and reporting.

## Contributors

- **Saima** - Backend Development, Frontend Design
- **Ibad** - Admin panel, Registration functionality.
- **Sakshi** - Minor contributions and administrative tasks.


---

Feel free to contribute to this project by submitting issues or pull requests!

