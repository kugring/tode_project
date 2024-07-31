<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@300;500&display=swap" />
  	<link href="${path}/resources/join/style.css" type="text/css" rel="stylesheet" />
  	<link href="${path}/resources/app.css" type="text/css" rel="stylesheet" />
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  	 <form action="join.do" method="post" name="join">
		 <div class="signup-page">
			 <div class="siginup-container">
				 <div class="signup-header" id="signUpHeaderContainer">
					 <div class="black-left-arrow icon-28"></div>
					 <a href="http://192.168.0.15:8080/user/home.do" class="b">가입하기 </a>
					 <div class="white-insta icon-24"></div>
				 </div>
				 <div class="default-image-parent">
					 <div class="white-default-profile icon-80"></div>
					 <b class="profile-image-edit-input">프로필 이미지</b>
				 </div>
				 <div class="signup-contents">
					 <div class="signup-input-boxs">
						 <div class="email-input">
							 <div class="div">이메일 등록 </div>
						 </div>
						 <div class="email-input">
							 <div class="div">비밀번호 등록 </div>
						 </div>
						 <div class="email-input">
							 <div class="div2">성별</div>
						 </div>
						 <div class="email-input">
							 <div class="div2">생년월일 </div>
						 </div>
					 </div>
					 <div class="personal-agree-box">
						 <div class="personal-agree-items">
							 <div class="required-selection">
								 <div class="black-check-circle icon-24"></div>
								 <div class="div4">
									 <div class="div5">
										 <div class="div2">필수</div>
										 <div class="divider">
										 </div>
									 </div>
									 <div class="div7">만 14세 이상입니다.</div>
								 </div>
							 </div>
							 <div class="required-selection">
								 <div class="empty-black-circle icon-24"></div>
								 <div class="div4">
									 <div class="div5">
										 <div class="div2">선택</div>
										 <div class="divider">
										 </div>
									 </div>
									 <div class="div7">마케팅 정보 수신에 동의합니다.</div>
								 </div>
							 </div>
						 </div>
					 </div>
						 <div class="div13">
						<span>
						<span class="tode">다른 기기에서 로그인 가능합니다. 가입과 동시에 TODE의</span>
						<span class="span"> </span>
							</span>
							 <span class="span">
								<span>이용약관</span>
							</span>
							 <span class="tode">과 </span>
							 <span class="span">개인정보 정책</span>
							 <span class="tode">에 동의하는 것으로 간주됩니다.</span>
						 </div>
					 </div>
				 </div>
			 <div class="signup-buttom" id="signUpButtomContainer">
				 <div class="text">가입하기 </div>
			 </div>
			 </div>

	 </form>

		 <script>
			 var signUpHeaderContainer = document.getElementById("signUpHeaderContainer");
			 if(signUpHeaderContainer) {
				 signUpHeaderContainer.addEventListener("click", function (e) {
// Add your code here
				 });
			 }
			 var signUpButtomContainer = document.getElementById("signUpButtomContainer");
			 if(signUpButtomContainer) {
				 signUpButtomContainer.addEventListener("click", function (e) {
// Add your code here
				 });
			 }
		 </script>
<!--   	<script>

	let emailCheck = false;
	
	$("#btn_id_valid").on("click", function(){
		let email = $("#email");
		if(email.val().trim() == ""){
			alert("이메일을 입력해주세요")
			return;
		}
		
		$.ajax({
			type : "post",
			url : "<c:url value='/user/emailCheck.do'/>",
			data : {
				"email" : email.val()
			},
			success : function(data){
				console.log(data.result)
				if(data.result == "success"){
					//아이디 중복된 값이 없다.
					emailCheck = true;
					console.log("회원가입 가능한 이메일")
				}else{
					//아이디 중복된 값이 있다.
					emailCheck = false;
					console.log("회원 이메일 중복")
				}
			}
			
		})
	
	})
	

  
</script> -->
  	
  	
  	
</body>
</html>