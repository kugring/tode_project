package com.ezen.backend.VO;

import java.util.Date;  // Date 타입을 사용할 경우 import

public class UserVO {
	private String email;
	private String password;
	private String gender;
	private String nickName;  // CamelCase 사용
	private String phoneNumber;  // CamelCase 사용
	private Boolean agreedPersonal;  // CamelCase 사용
	private String profileImage;  // CamelCase 사용
	private int userType;  // CamelCase 사용
	private int benCount;  // CamelCase 사용
	private String selfIntroduction;  // CamelCase 사용
	private Date createDate;  // Date 타입 사용
	private Date deleteDate;  // Date 타입 사용

	// Getters and Setters
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNickName() {  // CamelCase 사용
		return nickName;
	}
	public void setNickName(String nickName) {  // CamelCase 사용
		this.nickName = nickName;
	}
	public String getPhoneNumber() {  // CamelCase 사용
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {  // CamelCase 사용
		this.phoneNumber = phoneNumber;
	}
	public Boolean getAgreedPersonal() {  // CamelCase 사용
		return agreedPersonal;
	}
	public void setAgreedPersonal(Boolean agreedPersonal) {  // CamelCase 사용
		this.agreedPersonal = agreedPersonal;
	}
	public String getProfileImage() {  // CamelCase 사용
		return profileImage;
	}
	public void setProfileImage(String profileImage) {  // CamelCase 사용
		this.profileImage = profileImage;
	}
	public int getUserType() {  // CamelCase 사용
		return userType;
	}
	public void setUserType(int userType) {  // CamelCase 사용
		this.userType = userType;
	}
	public int getBenCount() {  // CamelCase 사용
		return benCount;
	}
	public void setBenCount(int benCount) {  // CamelCase 사용
		this.benCount = benCount;
	}
	public String getSelfIntroduction() {  // CamelCase 사용
		return selfIntroduction;
	}
	public void setSelfIntroduction(String selfIntroduction) {  // CamelCase 사용
		this.selfIntroduction = selfIntroduction;
	}
	public Date getCreateDate() {  // Date 타입 사용
		return createDate;
	}
	public void setCreateDate(Date createDate) {  // Date 타입 사용
		this.createDate = createDate;
	}
	public Date getDeleteDate() {  // Date 타입 사용
		return deleteDate;
	}
	public void setDeleteDate(Date deleteDate) {  // Date 타입 사용
		this.deleteDate = deleteDate;
	}
}
