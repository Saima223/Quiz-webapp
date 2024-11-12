package testing.dao;

import testing.model.QuizQuestion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizQuestionDAO {
    private Connection connection;
    
    public QuizQuestionDAO(Connection connection) {
        this.connection = connection;
    }
    
    public List<QuizQuestion> getQuestionsByQuizId(int quizId) throws SQLException {
        List<QuizQuestion> questions = new ArrayList<>();
        String query = "SELECT * FROM questions WHERE quiz_id = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, quizId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    QuizQuestion question = new QuizQuestion();
                    question.setQuestionId(rs.getInt("question_id"));
                    question.setQuizId(rs.getInt("quiz_id"));
                    question.setQuestionText(rs.getString("question_text"));
                    question.setOption1(rs.getString("option1"));
                    question.setOption2(rs.getString("option2"));
                    question.setOption3(rs.getString("option3"));
                    question.setOption4(rs.getString("option4"));
                    question.setCorrectOption(rs.getInt("correct_option"));
                    questions.add(question);
                }
            }
        }
        return questions;
    }
}