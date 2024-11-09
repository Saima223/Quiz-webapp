package testing.dao;

import testing.model.QuizResult;
import java.sql.*;

public class QuizResultDAO {
    private Connection connection;

    public QuizResultDAO(Connection connection) {
        this.connection = connection;
    }

    // Save the quiz result to the database
    public void saveQuizResult(QuizResult result) throws SQLException {
        
        String query = "INSERT INTO quizresults (quiz_id, id, score, total_questions) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, result.getQuizId());        
            pstmt.setInt(2, result.getId());            
            pstmt.setInt(3, result.getScore());        
            pstmt.setInt(4, result.getTotalQuestions()); 
            pstmt.executeUpdate();                       // Execute the update
        }
    }
}
