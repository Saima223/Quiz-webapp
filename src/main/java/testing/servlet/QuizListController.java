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
        try (Connection conn = DBConnection.getConnection()) {
       	 // Fetch the list of quizzes from the database or model
            QuizDAO quizDAO = new QuizDAO(conn);
            List<Quiz> quizzes = quizDAO.getAllQuizzes();        
            request.setAttribute("quizzes", quizzes);
            // Forward the request to quizzes.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quiz.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Database error", e);
        }
    }
}