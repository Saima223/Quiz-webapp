package testing.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import testing.dbConnectiom.DBConnection;
import testing.model.Users;

public class UserDAO {

    // Check if a user with the given email exists
    public boolean userExists(String email) throws ClassNotFoundException {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM userregister WHERE email = ?";

        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                exists = resultSet.getInt(1) > 0; // Check if user exists
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions for debugging
        }

        return exists;
    }

    // Register a new user
    public boolean registerUser(Users user) throws ClassNotFoundException {
        boolean result = false;
        String sql = "INSERT INTO userregister (anumber, fname, email, pnumber, pswd) VALUES (?, ?, ?, ?, ?)";

        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, user.getAnumber());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setLong(4, user.getPnumber());
            preparedStatement.setString(5, user.getPassword());

            int rowsInserted = preparedStatement.executeUpdate();
            result = rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace(); // Log any exceptions for debugging
        }

        return result;
    }

    // Validate user credentials for login
    public Users validateUser(String email, String pswd) {
        String sql = "SELECT * FROM userregister WHERE email = ? AND pswd = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, pswd);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Users user = new Users();
                    user.setId(resultSet.getInt("id")); // Retrieve ID
                    user.setAnumber(resultSet.getString("anumber")); // Retrieve admission number
                    user.setUsername(resultSet.getString("fname")); // Retrieve username
                    user.setEmail(resultSet.getString("email")); // Retrieve email
                    user.setPnumber(resultSet.getLong("pnumber")); // Retrieve phone number
                    user.setPassword(resultSet.getString("pswd")); // Retrieve password
                    return user; 
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get a user by ID
    public Users getUserById(int id) throws SQLException, ClassNotFoundException {
        Users user = null;
        String sql = "SELECT * FROM userregister WHERE id = ?";

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String anumber = resultSet.getString("anumber");
                    String Username = resultSet.getString("fname");
                    String email = resultSet.getString("email");
                    long pnumber = resultSet.getLong("pnumber");
                    String Password = resultSet.getString("pswd");

                    user = new Users(id, anumber, Username, email, pnumber, Password);
                }
            }
        }

        return user;
    }
}