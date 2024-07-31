package com.ezen.backend.VO;

import java.util.List;

public class GoalVO {
    private int todoTitleId;
    private int colorId;
    private String email;
    private String todoTitle;
    private String titleTodoOpen;
    private String colorCode;
    private List<FeedVO> feedList;

    public int getTodoTitleId() {
        return todoTitleId;
    }

    public void setTodoTitleId(int todoTitleId) {
        this.todoTitleId = todoTitleId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTodoTitle() {
        return todoTitle;
    }

    public void setTodoTitle(String todoTitle) {
        this.todoTitle = todoTitle;
    }

    public String getTitleTodoOpen() {
        return titleTodoOpen;
    }

    public void setTitleTodoOpen(String titleTodoOpen) {
        this.titleTodoOpen = titleTodoOpen;
    }

    public List<FeedVO> getFeedList() {
        return feedList;
    }

    public void setFeedList(List<FeedVO> feedList) {
        this.feedList = feedList;
    }

    public String getColorCode() {
        return colorCode;
    }

    public void setColorCode(String colorCode) {
        this.colorCode = colorCode;
    }
}
