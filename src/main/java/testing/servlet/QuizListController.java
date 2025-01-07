//no changes needed 
package testing.servlet;

import testing.dao.QuizDAO;
import testing.dbConnectiom.DBConnection;
import testing.model.Quiz;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/quizList")
public class QuizListController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Clear any existing quizId from session when showing quiz list
        HttpSession session = request.getSession();
        session.removeAttribute("currentQuizId");
        
        try (Connection conn = DBConnection.getConnection()) {
            QuizDAO quizDAO = new QuizDAO(conn);
            List<Quiz> quizzes = quizDAO.getAllQuizzes();        
            request.setAttribute("quizzes", quizzes);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quiz.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Database error", e);
        }
    }
}