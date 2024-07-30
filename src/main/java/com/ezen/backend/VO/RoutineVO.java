package com.ezen.backend.VO;

public class TodoRoutineVO {
	private int todoRoutineId; // 필드명을 todo_routine_id에서 todoRoutineId로 변경 (카멜 케이스 사용)
	private int todoTitleId; // 필드명을 todo_title_id에서 todoTitleId로 변경 (카멜 케이스 사용)
	private String startDate; // 필드명을 start_date에서 startDate로 변경 (카멜 케이스 사용)
	private String endDate; // 필드명을 end_date에서 endDate로 변경 (카멜 케이스 사용)
	private Boolean everyRepeat; // 필드명을 every_refeat에서 everyRepeat로 변경 (카멜 케이스 사용)

	public int getTodoRoutineId() {
		return todoRoutineId;
	}

	public void setTodoRoutineId(int todoRoutineId) {
		this.todoRoutineId = todoRoutineId;
	}

	public int getTodoTitleId() {
		return todoTitleId;
	}

	public void setTodoTitleId(int todoTitleId) {
		this.todoTitleId = todoTitleId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Boolean getEveryRepeat() {
		return everyRepeat;
	}

	public void setEveryRepeat(Boolean everyRepeat) {
		this.everyRepeat = everyRepeat;
	}
}