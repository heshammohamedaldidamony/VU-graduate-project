package com.graduateteam.VU.login;

public class User {
    private String role;
    private String phone;

    public User(String role, String phone) {
        this.role = role;
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
