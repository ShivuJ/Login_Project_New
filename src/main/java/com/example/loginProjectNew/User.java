package com.example.loginProjectNew;

public class User {
    String name;
    String email;
    String password;

    public User(String name, String email, String password) {
        this.password = password;
        this.email = email;
        this.name = name;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
