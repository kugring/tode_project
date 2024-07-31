package com.ezen.backend.VO;

import java.util.List;

public class FollowVO {
	private String email;
	private String followEmail; // 필드명을 follow_email에서 followEmail로 변경 (카멜 케이스 사용)

	private List<FollowVO> follower;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {

		this.email = email;
	}

	public String getFollowEmail() {

		return followEmail;
	}
	public void setFollowEmail(String followEmail) {
		this.followEmail = followEmail;
	}

	public List<FollowVO> getFollower() {
		return follower;
	}

	public void setFollower(List<FollowVO> follower) {
		this.follower = follower;
	}
}