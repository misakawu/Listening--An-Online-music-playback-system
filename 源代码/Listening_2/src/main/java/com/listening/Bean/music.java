package com.listening.Bean;

public class music {
    private int MusicID;
    private String MusicName;
    private String MusicianName;
    private String MusicBackground;
    private String MusicData;
    private int Like;

    public music(int musicID, String musicName, String musicianName, String musicBackground, String musicData, int like) {
        MusicID = musicID;
        MusicName = musicName;
        MusicianName = musicianName;
        MusicBackground = musicBackground;
        MusicData = musicData;
        Like = like;
    }

    public music() {}

    public int getMusicID() {
        return MusicID;
    }

    public void setMusicID(int musicID) {
        MusicID = musicID;
    }

    public String getMusicName() {
        return MusicName;
    }

    public void setMusicName(String musicName) {
        MusicName = musicName;
    }

    public String getMusicianName() {
        return MusicianName;
    }

    public void setMusicianName(String musicianName) {
        MusicianName = musicianName;
    }

    public String getMusicBackground() {
        return MusicBackground;
    }

    public void setMusicBackground(String musicBackground) {
        MusicBackground = musicBackground;
    }

    public String getMusicData() {
        return MusicData;
    }

    public void setMusicData(String musicData) {
        MusicData = musicData;
    }

    public int getLike() {
        return Like;
    }

    public void setLike(int like) {
        Like = like;
    }

    @Override
    public String toString() {
        return "music{" +
                "MusicID=" + MusicID +
                ", MusicName='" + MusicName + '\'' +
                ", MusicianName='" + MusicianName + '\'' +
                ", MusicBackground='" + MusicBackground + '\'' +
                ", MusicData='" + MusicData + '\'' +
                ", LikeMapper=" + Like +
                '}';
    }
}
