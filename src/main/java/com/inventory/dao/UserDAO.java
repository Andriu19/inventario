package com.inventory.dao;

import com.inventory.model.User;
import com.inventory.util.DBConnection;

import java.sql.*;

public class UserDAO {
    public User getUser(String username) throws SQLException {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        User user = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("UserID"));
                    user.setUsername(rs.getString("Username"));
                    user.setPassword(rs.getString("Password"));
                    user.setRole(rs.getString("Role"));
                }
            }
        }
        return user;
    }
}
