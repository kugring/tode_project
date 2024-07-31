package com.ezen.backend.VO;

public class BlockUserVO {
	private String email;
	private String blockEmail; // 필드명을 block_email에서 blockEmail로 변경 (카멜 케이스 사용)

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBlockEmail() {
		return blockEmail;
	}

	public void setBlockEmail(String blockEmail) {
		this.blockEmail = blockEmail;
	}
}