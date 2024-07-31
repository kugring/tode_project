package com.ezen.backend.VO;

public class ColorListVO {
	private int colorId; // 필드명을 color_id에서 colorId로 변경 (카멜 케이스 사용)
	private String colorCode; // 필드명을 color_code에서 colorCode로 변경 (카멜 케이스 사용)
	private String colorCategory; // 필드명을 color_category에서 colorCategory로 변경 (카멜 케이스 사용)

	public int getColorId() {
		return colorId;
	}

	public void setColorId(int colorId) {
		this.colorId = colorId;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public String getColorCategory() {
		return colorCategory;
	}

	public void setColorCategory(String colorCategory) {
		this.colorCategory = colorCategory;
	}
}