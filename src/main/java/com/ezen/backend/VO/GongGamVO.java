package com.ezen.backend.VO;

public class GongGamVO {
	private int gongGamId; // 필드명을 gong_gam_id에서 gongGamId로 변경 (카멜 케이스 사용)
	private String email;
	private int todoId; // 필드명을 todo_id에서 todoId로 변경 (카멜 케이스 사용)
	private int imojiId; // 필드명을 imoji_id에서 imojiId로 변경 (카멜 케이스 사용)

	public int getGongGamId() {
		return gongGamId;
	}

	public void setGongGamId(int gongGamId) {
		this.gongGamId = gongGamId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTodoId() {
		return todoId;
	}

	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}

	public int getImojiId() {
		return imojiId;
	}

	public void setImojiId(int imojiId) {
		this.imojiId = imojiId;
	}
}