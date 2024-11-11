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
import java.util.Enumeration;

@WebServlet("/submitQuiz")
public class SubmitQuizController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("\n=== Starting Quiz Submission Process ===");

        // Get session and check user authentication
        HttpSession session = request.getSession(false);
        Integer userId = session != null ? (Integer) session.getAttribute("userId") : null;
        
        if (userId == null) {
            System.out.println("ERROR: User ID is null - redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }

        // Get quiz ID from multiple sources
        String quizIdStr = request.getParameter("quizId");
        System.out.println("QuizId from parameter: " + quizIdStr);
        
        if (quizIdStr == null || quizIdStr.isEmpty()) {
            quizIdStr = String.valueOf(session.getAttribute("currentQuizId"));
            System.out.println("QuizId from session: " + quizIdStr);
        }

        // Validate quiz ID
        if (quizIdStr == null || quizIdStr.equals("null") || quizIdStr.trim().isEmpty()) {
            System.out.println("ERROR: No quiz ID found in either parameter or session");
            response.sendRedirect("quizList");
            return;
        }

        // Parse quiz ID
        int quizId;
        try {
            quizId = Integer.parseInt(quizIdStr);
            System.out.println("Parsed Quiz ID: " + quizId);
        } catch (NumberFormatException e) {
            System.out.println("ERROR: Failed to parse Quiz ID: " + quizIdStr);
            e.printStackTrace();
            response.sendRedirect("quizList");
            return;
        }

        // Process quiz submission
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("\nDatabase Connection Established");
            
            // Get questions
            QuizQuestionDAO questionDAO = new QuizQuestionDAO(conn);
            List<QuizQuestion> questions = questionDAO.getQuestionsByQuizId(quizId);
            
            if (questions.isEmpty()) {
                System.out.println("ERROR: No questions found for quiz ID: " + quizId);
                response.sendRedirect("quizList");
                return;
            }

            // Process answers and calculate score
            int score = 0;
            System.out.println("\nProcessing Answers:");
            for (QuizQuestion question : questions) {
                String paramName = "question_" + question.getQuestionId();
                String submittedAnswer = request.getParameter(paramName);
                
                if (submittedAnswer != null && !submittedAnswer.isEmpty()) {
                    try {
                        int submittedOption = Integer.parseInt(submittedAnswer);
                        if (submittedOption == question.getCorrectOption()) {
                            score++;
                        }
                        System.out.println("Question " + question.getQuestionId() + 
                                         ": Submitted=" + submittedOption + 
                                         ", Correct=" + question.getCorrectOption());
                    } catch (NumberFormatException e) {
                        System.out.println("WARNING: Invalid answer format for question " + 
                                         question.getQuestionId());
                    }
                }
            }

            // Calculate and save results
            double percentage = (score / (double) questions.size()) * 100;
            System.out.println("\nFinal Score: " + score + "/" + questions.size() + 
                             " (" + percentage + "%)");

            // Save result to database
            QuizResultDAO resultDAO = new QuizResultDAO(conn);
            QuizResult result = new QuizResult(quizId, userId, score, questions.size());
            resultDAO.saveQuizResult(result);
            System.out.println("Quiz result saved to database");

            // Set attributes for result page
            request.setAttribute("score", score);
            request.setAttribute("totalQuestions", questions.size());
            request.setAttribute("percentage", percentage);
            request.setAttribute("quizId", quizId);

            // Forward to result page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/quizResult.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            System.out.println("\nERROR: Unexpected exception occurred:");
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}