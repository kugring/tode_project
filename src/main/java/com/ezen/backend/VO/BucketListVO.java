package com.ezen.backend.VO;

import java.util.List;

public class BucketListVO {
	private int bucketId; // 필드명을 bucket_id에서 bucketId로 변경 (카멜 케이스 사용)
	private String email;
	private String bucket;

	public int getBucketId() {
		return bucketId;
	}

	public void setBucketId(int bucketId) {
		this.bucketId = bucketId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBucket() {
		return bucket;
	}

	public void setBucket(String bucket) {
		this.bucket = bucket;
	}
}