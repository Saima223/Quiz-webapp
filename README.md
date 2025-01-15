# Quiz Web App

A dynamic and interactive Quiz Web Application built using Java Servlet, JSP, and MySQL, following the MVC design pattern.

## Features

- User authentication with secure registration and login
- Category-based quiz selection
- Random and Difficulty level based question selection
- Results display with scoring and try again functionality
- MySQL database integration

## Technology Stack

- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets
- **Database**: MySQL
- **Build Tool**: Maven
- **IDE**: Eclipse

## Project Structure

```
QuizProject/
├── src/
│   └── main/
│       ├── java/testing/
│       │   ├── dao/               # Database access objects
│       │   ├── dbConnection/      # Database connection utilities
│       │   ├── filter/            # Web filters
│       │   ├── model/             # Data models
│       │   └── servlet/           # Servlet controllers
│       └── webapp/                # Web resources
├── target/                        # Compiled output
├── .classpath
├── .gitignore
├── .project
├── README.md
└── pom.xml                        # Maven configuration

```

## Setup Instructions

### Prerequisites

- Java JDK 8+
- Eclipse IDE
- XAMPP (MySQL)
- Maven

### Installation

1. Clone the repository:
   ```bash
   git clone <https://github.com/Saima223/Quiz-webapp.git>
   ```

2. Import project into Eclipse:
   - File > Import > Existing Maven Project

3. Configure database:
   - Create database named `quiz_db`
   - Import `quiz_db.sql`

4. Update database settings in `DBConnection.java`

5. Run the application on a server (e.g., Apache Tomcat)

## Planned Features

- Password hashing
- Enhanced analytics


---

For issues or contributions, please submit a pull request.
