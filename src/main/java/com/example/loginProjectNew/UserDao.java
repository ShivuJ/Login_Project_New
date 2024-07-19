package com.example.loginProjectNew;

import org.jetbrains.annotations.NotNull;

import java.sql.*;

public class UserDao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Corrected the URL to include a colon after localhost
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    public static int save(@NotNull User u) throws SQLException {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("insert into login (name, email, password) values (?, ?, ?)");
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

    public static int getUser(@org.jetbrains.annotations.NotNull User u) throws SQLException {
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from login where email = ?,password = ?");
            ps.setString(1, u.getEmail());
            ps.setString(2, u.getPassword());

            status = ps.executeUpdate();
            System.out.println("Data fetched successfully");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return status;
    }

    public static String getUserEmail(User u) throws SQLException {
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select email from login where email = ?");
            ps.setString(1, u.getEmail());
            ResultSet resultSet = ps.executeQuery();
            System.out.println("Data fetched successfully");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }

        return "Data fetched successfully";
    }

    public static String getUserPassword(User u) throws SQLException {
        int status = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select password from login where password = ?");
            ps.setString(1, u.getPassword());
            ResultSet resultSet = ps.executeQuery();
            System.out.println("Data fetched successfully");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return "Data fetched successfully";
    }
}
