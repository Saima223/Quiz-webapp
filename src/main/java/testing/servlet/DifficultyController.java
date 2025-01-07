package testing.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//DifficultyController.java
@WebServlet("/difficulty")
public class DifficultyController extends HttpServlet {
 
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
     
     HttpSession session = request.getSession();
     String quizId = request.getParameter("quizId");
     
     System.out.println("Debug - DifficultyController doGet - Received quizId: " + quizId);
     
     if (quizId != null && !quizId.trim().isEmpty() && !quizId.equals("null")) {
         try {
             // Store in both session and request
             session.setAttribute("currentQuizId", Integer.parseInt(quizId));
             request.setAttribute("quizId", quizId);
             
             System.out.println("Debug - DifficultyController doGet - Stored quizId in session: " + quizId);
             
             request.getRequestDispatcher("/difficulty.jsp").forward(request, response);
             return;
         } catch (NumberFormatException e) {
             System.out.println("Debug - Invalid quizId format: " + quizId);
         }
     }
     
     System.out.println("Debug - Invalid or missing quizId, redirecting to quiz list");
     response.sendRedirect("quizList");
 }
 
 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
     
     HttpSession session = request.getSession();
     
     // Try to get quizId from multiple sources
     String quizId = request.getParameter("quizId");
     if (quizId == null || quizId.trim().isEmpty()) {
         Object sessionQuizId = session.getAttribute("currentQuizId");
         quizId = sessionQuizId != null ? sessionQuizId.toString() : null;
     }
     
     String difficulty = request.getParameter("difficulty");
     String randomCount = request.getParameter("randomCount");
     
     System.out.println("Debug - DifficultyController doPost");
     System.out.println("Session ID: " + session.getId());
     System.out.println("QuizId from parameter: " + request.getParameter("quizId"));
     System.out.println("QuizId from session: " + session.getAttribute("currentQuizId"));
     System.out.println("Final QuizId being used: " + quizId);
     System.out.println("Difficulty: " + difficulty);
     System.out.println("RandomCount: " + randomCount);
     
     if (quizId != null && difficulty != null) {
         try {
             int quizIdInt = Integer.parseInt(quizId);
             session.setAttribute("currentQuizId", quizIdInt);
             session.setAttribute("currentDifficulty", difficulty);
             
             if ("random".equals(difficulty) && randomCount != null) {
                 session.setAttribute("randomCount", randomCount);
             }
             
             response.sendRedirect("quizQuestion?quizId=" + quizIdInt + 
                                "&difficulty=" + difficulty +
                                (randomCount != null ? "&randomCount=" + randomCount : ""));
         } catch (NumberFormatException e) {
             System.out.println("Debug - Invalid quizId format in POST: " + quizId);
             response.sendRedirect("quizList");
         }
     } else {
         System.out.println("Debug - Missing required parameters in POST");
         System.out.println("quizId: " + quizId);
         System.out.println("difficulty: " + difficulty);
         response.sendRedirect("quizList");
     }
 }
}