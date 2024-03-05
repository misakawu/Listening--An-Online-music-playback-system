package com.listening.Bean;

public class like {
    private int LikeID;
    private int UserID;
    private int MusicID;

    public like(int likeID, int userID, int musicID) {
        LikeID = likeID;
        UserID = userID;
        MusicID = musicID;
    }
    public like() {}

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public int getMusicID() {
        return MusicID;
    }

    public void setMusicID(int musicID) {
        MusicID = musicID;
    }

    public int getLikeID() {
        return LikeID;
    }

    public void setLikeID(int likeID) {
        LikeID = likeID;
    }

    @Override
    public String toString() {
        return "like{" +
                "LikeID=" + LikeID +
                ", UserID=" + UserID +
                ", MusicID=" + MusicID +
                '}';
    }
}
