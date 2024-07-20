package com.example.loginProjectNew;

import org.jetbrains.annotations.NotNull;

import java.sql.*;

public class UserDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    public static int save(@NotNull User u) throws SQLException {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("insert into login (name, email, password) values (?, ?, ?)")) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            status = ps.executeUpdate();
            System.out.println("Data inserted successfully");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return status;
    }

    public static String getUserEmail(User u) throws SQLException {
        String email = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("select email from login where email = ?")) {
            ps.setString(1, u.getEmail());
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    email = resultSet.getString("email");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return email;
    }

    public static String getUserPassword(User u) throws SQLException {
        String password = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("select password from login where email = ?")) {
            ps.setString(1, u.getEmail());
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    password = resultSet.getString("password");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return password;
    }
}
