package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import testing.model.Users;

public class UserDAO {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return java.sql.DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/quiz_db",
                "root",
                "" // Use empty string if no password
            );
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }

    public Users validateUser(String email, String pswd) {
        String sql = "SELECT * FROM userregister WHERE email = ? AND pswd = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, pswd);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Users users = new Users();
                    users.setId(rs.getInt("id")); // Retrieve ID
                    users.setUsername(rs.getString("fname")); // Retrieve username
                    users.setEmail(rs.getString("email")); // Retrieve email
                    users.setPassword(rs.getString("pswd")); // Retrieve password
                    return users; 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
