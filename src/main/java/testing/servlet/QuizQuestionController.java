package testing.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import testing.dao.QuizQuestionDAO;
import testing.dbConnectiom.DBConnection;
import testing.model.QuizQuestion;

@WebServlet("/quizQuestion")
public class QuizQuestionController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String quizId = request.getParameter("quizId");
        
        if (quizId != null) {
            try (Connection conn = DBConnection.getConnection()) {
                QuizQuestionDAO questionDAO = new QuizQuestionDAO(conn);
                List<QuizQuestion> questions = questionDAO.getQuestionsByQuizId(Integer.parseInt(quizId));
                request.setAttribute("questions", questions);
                request.getRequestDispatcher("question.jsp").forward(request, response);
            } catch (Exception e) {
                throw new ServletException("Database error", e);
            }
        } else {
            response.sendRedirect("quizList"); // Redirect to quiz list if no quizId
        }
    }
}