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
	<link href="${path}/resources/login/style.css" type="text/css" rel="stylesheet" />
	<link href="${path}/resources/app.css" type="text/css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<form id="loginForm" action="login.do" method="post">
	<div class="signup-page">
		<div class="siginup-container">
			<div class="signup-header" id="signUpHeaderContainer">
				<div class="black-left-arrow icon-28"></div>
				<b class="b">로그인 </b>
				<div class="white-insta icon-24"></div>
			</div>
			<div class="signup-contents">
				<div class="signup-input-boxs">
					<div class="email-input">
						<input class="no-border" type="text" name="email" placeholder="이메일">
					</div>

					<div class="email-input">
						<input class="no-border" type="password" name="password" placeholder="비밀번호">
					</div>
				</div>
			</div>
			<div class="signup-buttom" id="signUpButtomContainer">
				<div class="text" id="submitText">확인</div>
				<input id="submit_button" style="display: none" type="submit"  />
			</div>
			<div class="password-check">비밀번호를 잊어버렸다면?</div>
		</div>
	</div>
</form>

<script>
	document.getElementById('submitText').addEventListener('click', function() {
		document.getElementById('submit_button').click();
	});
</script>

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