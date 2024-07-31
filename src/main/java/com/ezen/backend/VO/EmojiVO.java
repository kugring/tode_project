package com.ezen.backend.VO;

public class EmojiVO {
	private int imojiId; // 필드명을 imoji_id에서 imojiId로 변경 (카멜 케이스 사용)
	private String imojiName; // 필드명을 imoji_name에서 imojiName로 변경 (카멜 케이스 사용)

	public int getImojiId() {
		return imojiId;
	}

	public void setImojiId(int imojiId) {
		this.imojiId = imojiId;
	}

	public String getImojiName() {
		return imojiName;
	}

	public void setImojiName(String imojiName) {
		this.imojiName = imojiName;
	}
}