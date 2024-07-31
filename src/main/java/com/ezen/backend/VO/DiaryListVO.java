package com.ezen.backend.VO;

public class DiaryListVO {
	private int diaryId; // 필드명을 diary_id에서 diaryId로 변경 (카멜 케이스 사용)
	private int imojiId; // 필드명을 imoji_id에서 imojiId로 변경 (카멜 케이스 사용)
	private int colorId; // 필드명을 color_id에서 colorId로 변경 (카멜 케이스 사용)
	private String email;
	private String diaryContent; // 필드명을 diary_content에서 diaryContent로 변경 (카멜 케이스 사용)
	private int diaryOpen; // 필드명을 diary_open에서 diaryOpen으로 변경 (카멜 케이스 사용)
	private String diaryCreateDate; // 필드명을 diary_create_date에서 diaryCreateDate로 변경 (카멜 케이스 사용)
	private String diaryEditDate; // 필드명을 diary_edit_date에서 diaryEditDate로 변경 (카멜 케이스 사용)

	public int getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}

	public int getImojiId() {
		return imojiId;
	}

	public void setImojiId(int imojiId) {
		this.imojiId = imojiId;
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

	public String getDiaryContent() {
		return diaryContent;
	}

	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}

	public int getDiaryOpen() {
		return diaryOpen;
	}

	public void setDiaryOpen(int diaryOpen) {
		this.diaryOpen = diaryOpen;
	}

	public String getDiaryCreateDate() {
		return diaryCreateDate;
	}

	public void setDiaryCreateDate(String diaryCreateDate) {
		this.diaryCreateDate = diaryCreateDate;
	}

	public String getDiaryEditDate() {
		return diaryEditDate;
	}

	public void setDiaryEditDate(String diaryEditDate) {
		this.diaryEditDate = diaryEditDate;
	}
}