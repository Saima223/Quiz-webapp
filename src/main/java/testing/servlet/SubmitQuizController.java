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
import java.util.Random;
import java.util.stream.Collectors;

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

        // Get quiz ID, difficulty, and random count from session
        Integer quizId = (Integer) session.getAttribute("currentQuizId");
        String difficulty = (String) session.getAttribute("currentDifficulty");
        String randomCount = (String) session.getAttribute("randomCount");
        
        System.out.println("Quiz submission - QuizId: " + quizId + ", Difficulty: " + difficulty);

        // Validate quiz ID
        if (quizId == null) {
            System.out.println("ERROR: No quiz ID found in session");
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

            // Filter questions based on difficulty
            if (difficulty != null && !difficulty.equals("random")) {
                questions = questions.stream()
                    .filter(q -> q.getDifficulty().equalsIgnoreCase(difficulty))
                    .collect(Collectors.toList());
                
                if (questions.isEmpty()) {
                    System.out.println("ERROR: No questions found for difficulty: " + difficulty);
                    response.sendRedirect("difficulty?quizId=" + quizId);
                    return;
                }
            } else if (difficulty != null && difficulty.equals("random") && randomCount != null) {
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
                    System.out.println("WARNING: Invalid randomCount: " + randomCount);
                }
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

            // Save result to database
            QuizResultDAO resultDAO = new QuizResultDAO(conn);
            QuizResult result = new QuizResult(quizId, userId, score, questions.size());
            resultDAO.saveQuizResult(result);
            System.out.println("Quiz result saved to database");

            // Set attributes for JSP
            String fname = (String) session.getAttribute("fname");
            request.setAttribute("fname", fname);
            String category = questionDAO.getCategory(quizId);
            if (category == null) {
                category = "Unknown Category";
            }
            request.setAttribute("category", category);
            request.setAttribute("score", score);
            request.setAttribute("totalQuestions", questions.size());
            request.setAttribute("quizId", quizId);
            
            // Keep difficulty settings in session for "Try Again" functionality
            request.setAttribute("difficulty", difficulty);
            if ("random".equals(difficulty)) {
                request.setAttribute("randomCount", randomCount);
            }

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