package com.ezen.backend.VO;

public class FeedVO {
	private int todoId;
	private int todoTitleId;
	private String email;
	private String todoContent;
	private String todoCreateDate;
	private String todoEditDate;
	private String todoCheck;
	private String todoImage;
	private String todoMemo;
	private String todoAlarm;

	public int getTodoId() {
		return todoId;
	}
	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}

	public String getTodoCreateDate() {
		return todoCreateDate;
	}
	public void setTodoCreateDate(String todoCreateDate) {
		this.todoCreateDate = todoCreateDate;
	}

	public String getTodoEditDate() {
		return todoEditDate;
	}
	public void setTodoEditDate(String todoEditDate) {
		this.todoEditDate = todoEditDate;
	}

	public String getTodoCheck() {
		return todoCheck;
	}
	public void setTodoCheck(String todoCheck) {
		this.todoCheck = todoCheck;
	}

	public String getTodoImage() {
		return todoImage;
	}
	public void setTodoImage(String todoImage) {
		this.todoImage = todoImage;
	}

	public String getTodoMemo() {
		return todoMemo;
	}
	public void setTodoMemo(String todoMemo) {
		this.todoMemo = todoMemo;
	}

	public String getTodoAlarm() {
		return todoAlarm;
	}
	public void setTodoAlarm(String todoAlarm) {
		this.todoAlarm = todoAlarm;
	}

	public int getTodoTitleId() {
		return todoTitleId;
	}
	public void setTodoTitleId(int todoTitleId) {
		this.todoTitleId = todoTitleId;
	}
}
