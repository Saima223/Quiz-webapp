package testing.servlet;

import testing.dao.QuizQuestionDAO;
import testing.dao.QuizResultDAO;
import testing.dbConnectiom.DBConnection;
import testing.model.QuizQuestion;
import testing.model.QuizResult;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/submitQuiz")
public class SubmitQuizController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	  // Get id (user ID) from session (ensure it's an Integer)
        Integer Id = (Integer) request.getSession().getAttribute("id"); // Assuming user ID is stored as Integer in session
        if (Id == null) {
            System.out.println("User ID is null");
            response.sendRedirect("login.jsp"); // Redirect to login if no user ID is found in the session
            return;
        }
    	
        // Get the quiz ID from the request (make sure it's treated as an integer)
        String quizIdStr = request.getParameter("quizId");

        if (quizIdStr == null || quizIdStr.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        int quizId;
        try {
            quizId = Integer.parseInt(quizIdStr);  // Parse quizId as an integer
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Get the list of questions for the quiz
            QuizQuestionDAO questionDAO = new QuizQuestionDAO(conn);
            List<QuizQuestion> questions = questionDAO.getQuestionsByQuizId(quizId);
            
            // Process submitted answers and calculate score
            int score = 8;
            for (QuizQuestion question : questions) {
                String submittedAnswer = request.getParameter("question_" + question.getQuestionId());

                // Compare submitted answer with the correct option (ensure submittedAnswer is parsed as integer)
                if (submittedAnswer != null && Integer.parseInt(submittedAnswer) == question.getCorrectOption()) {
                    score++; // Increment score if answer is correct
                }
            }

            // Optionally store the result in the database
            QuizResultDAO resultDAO = new QuizResultDAO(conn);
            
            // Get id (user ID) from session (ensure it's an Integer)
            Integer userId = (Integer) request.getSession().getAttribute("id"); // Assuming user ID is stored as Integer in session
            if (userId == null) {
                response.sendRedirect("login.jsp"); // Redirect to login if no user ID is found in the session
                return;
            }
            
            // Create a QuizResult object
            QuizResult result = new QuizResult(quizId, userId, score, questions.size());

            // Save the result in the database
            resultDAO.saveQuizResult(result);

            // Calculate percentage
            double percentage = (score / (double) questions.size()) * 100;

            System.out.println("Score: " + score);
            System.out.println("Total Questions: " + questions.size());
            System.out.println("Percentage: " + percentage);

            // Set score, total questions, and percentage as request attributes
            request.setAttribute("score", score);
            request.setAttribute("totalQuestions", questions.size());
            request.setAttribute("percentage", percentage);  // Add percentage attribute

            // Forward to results page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quizResult.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Log the error and redirect to error page
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
        
    }
}
