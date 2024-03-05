package com.listening.Bean;

public class user {
    private int UserID;
    private String UserName;
    private String UserPassword;
    private int UserOffline;
    private int Manager;

    public int getUserOffline() {
        return UserOffline;
    }

    public void setUserOffline(int userOffline) {
        UserOffline = userOffline;
    }

    public int getManager() {
        return Manager;
    }

    public void setManager(int manager) {
        Manager = manager;
    }

    public user(int userID, String userName, String userPassword, int userOffline, int manager) {
        UserID = userID;
        UserName = userName;
        UserPassword = userPassword;
        UserOffline = userOffline;
        Manager = manager;
    }

    public user() {}

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    @Override
    public String toString() {
        return "user{" +
                "UserID=" + UserID +
                ", UserName='" + UserName + '\'' +
                ", UserPassword='" + UserPassword + '\'' +
                ", UserOffline=" + UserOffline +
                ", Manager=" + Manager +
                '}';
    }
}
