package com.ezen.backend.VO;

import java.util.List;

public class TodoTitleVO {
	private int todo_title_id;
	private int color_id;
	private String email;
	private String todo_title;
	private int title_todo_open;
	private String title_color;
	private List<UserVO> users; 
	
	
	
	public int getTodo_title_id() {
		return todo_title_id;
	}
	public void setTodo_title_id(int todo_title_id) {
		this.todo_title_id = todo_title_id;
	}
	
	
	public int getColor_id() {
		return color_id;
	}
	public void setColor_id(int color_id) {
		this.color_id = color_id;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getTodo_title() {
		return todo_title;
	}
	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}
	
	
	public int getTitle_todo_open() {
		return title_todo_open;
	}
	public void setTitle_todo_open(int title_todo_open) {
		this.title_todo_open = title_todo_open;
	}
	
	
	public String getTitle_color() {
		return title_color;
	}
	public void setTitle_color(String title_color) {
		this.title_color = title_color;
	}
	
	
	
	
	
	
	
	
	
}
