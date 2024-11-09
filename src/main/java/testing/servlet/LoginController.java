package testing.servlet;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import testing.dao.UserDAO; // Import the UserDAO class
import testing.model.Users;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserDAO userDAO; // Declare an instance of UserDAO

    // Default constructor
    public LoginController() {
        super();
        userDAO = new UserDAO(); // Initialize the UserDAO instance
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	String email = request.getParameter("email");
    	String pswd = request.getParameter("password");

    	System.out.println("Email: " + email);
    	System.out.println("Password: " + pswd);
        
        
        // Call validateUser on userDAO instance
        Users user = userDAO.validateUser(email, pswd);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("successMessage", "Login successful! Welcome, " + user.getUsername());
            response.sendRedirect("quiz.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
