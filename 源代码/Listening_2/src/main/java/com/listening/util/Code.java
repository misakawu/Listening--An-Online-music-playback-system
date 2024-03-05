package com.listening.util;

public class Code {
    private int type;
    private String description;
    private String data;

    public Code() {}
    public Code(int type, String description, String data) {
        this.type = type;
        this.description = description;
        this.data=data;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }



    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
