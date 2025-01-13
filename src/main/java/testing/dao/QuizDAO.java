package testing.dao;

import testing.model.Quiz;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {
    private Connection connection;
    
    public QuizDAO(Connection connection) {
        this.connection = connection;
    }
    
    public List<Quiz> getAllQuizzes() throws SQLException {
        List<Quiz> quizzes = new ArrayList<>();
        String query = "SELECT * FROM quizzes";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizId(rs.getInt("quiz_id"));
                quiz.setTitle(rs.getString("title"));
                quiz.setDescription(rs.getString("description"));
                quiz.setCategory(rs.getString("category"));
                quiz.setTotalQuestions(rs.getInt("total_questions"));
                quiz.setImagePath(rs.getString("image_path"));
                quizzes.add(quiz);
            }
        }
        return quizzes;
    }
}