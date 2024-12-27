package testing.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/difficulty")
public class DifficultyController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String quizId = request.getParameter("quizId");
        
        if (quizId != null && !quizId.equals("null")) {
            // Store quizId in both session and request
            HttpSession session = request.getSession();
            session.setAttribute("currentQuizId", quizId);
            request.setAttribute("quizId", quizId);
            
            // Forward to difficulty selection page
            request.getRequestDispatcher("difficulty.jsp").forward(request, response);
        } else {
            response.sendRedirect("quizList");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String difficulty = request.getParameter("difficulty");
        String randomCount = request.getParameter("randomCount");
        String quizId = request.getParameter("quizId");
        
        // If quizId is null or "null", try to get it from session
        if (quizId == null || quizId.equals("null")) {
            HttpSession session = request.getSession();
            Object sessionQuizId = session.getAttribute("currentQuizId");
            quizId = sessionQuizId != null ? sessionQuizId.toString() : null;
        }
        
        // Validate all required parameters
        if (quizId != null && !quizId.equals("null") && difficulty != null) {
            StringBuilder redirectURL = new StringBuilder("quizQuestion?quizId=")
                .append(quizId)
                .append("&difficulty=")
                .append(difficulty);
            
            if ("random".equals(difficulty) && randomCount != null) {
                redirectURL.append("&randomCount=").append(randomCount);
            }
            
            response.sendRedirect(redirectURL.toString());
        } else {
            // Log the error values for debugging
            System.out.println("Debug - quizId: " + quizId);
            System.out.println("Debug - difficulty: " + difficulty);
            response.sendRedirect("quizList");
        }
    }
}