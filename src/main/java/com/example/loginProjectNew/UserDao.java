package com.example.loginProjectNew;

import org.jetbrains.annotations.NotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return status;
    }
}
