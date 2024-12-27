package testing.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import testing.dao.QuizQuestionDAO;
import testing.dbConnectiom.DBConnection;
import testing.model.QuizQuestion;

@WebServlet("/quizQuestion")
public class QuizQuestionController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String quizId = request.getParameter("quizId");
        
        // First try to get quizId from request parameter
        if (quizId == null || quizId.equals("null")) {
            // If not in request, try session
            HttpSession session = request.getSession();
            Object sessionQuizId = session.getAttribute("currentQuizId");
            quizId = sessionQuizId != null ? sessionQuizId.toString() : null;
        }
        
        // If we still don't have a valid quizId, redirect to quiz list
        if (quizId == null || quizId.equals("null")) {
            response.sendRedirect("quizList");
            return;
        }
        
        try (Connection conn = DBConnection.getConnection()) {
            QuizQuestionDAO questionDAO = new QuizQuestionDAO(conn);
            List<QuizQuestion> questions = questionDAO.getQuestionsByQuizId(Integer.parseInt(quizId));
            
            // Get difficulty parameter
            String difficulty = request.getParameter("difficulty");
            String randomCount = request.getParameter("randomCount");
            
            // Filter questions based on difficulty
            if (difficulty != null && !difficulty.equals("random")) {
                questions = questions.stream()
                    .filter(q -> q.getDifficulty().equalsIgnoreCase(difficulty))
                    .collect(Collectors.toList());
            } 
            // Handle random selection
            else if (difficulty != null && difficulty.equals("random") && randomCount != null) {
                try {
                    int count = Integer.parseInt(randomCount);
                    if (questions.size() > count) {
                        Random rand = new Random();
                        questions = questions.stream()
                            .sorted((a, b) -> rand.nextInt(3) - 1)
                            .limit(count)
                            .collect(Collectors.toList());
                    }
                } catch (NumberFormatException e) {
                    // Log error but continue with all questions
                    System.err.println("Invalid randomCount parameter: " + randomCount);
                }
            }
            
            request.setAttribute("questions", questions);
            request.setAttribute("quizId", quizId);
            request.setAttribute("difficulty", difficulty);
            
            String title = questionDAO.getTitle(quizId);
            if (title == null) {
                title = "Unknown title";
            }
            request.setAttribute("title", title);
            
            request.getRequestDispatcher("question.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Error processing quiz questions: " + e.getMessage());
            throw new ServletException("Database error", e);
        }
    }
}