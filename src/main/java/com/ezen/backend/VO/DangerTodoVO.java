package com.ezen.backend.VO;

public class DangerTodoVO {
	private int todoId; // 필드명을 todo_id에서 todoId로 변경 (카멜 케이스 사용)
	private String email;

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
}