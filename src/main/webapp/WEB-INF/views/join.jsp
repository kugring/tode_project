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
  	<link href="${path}/resources/css/join/style.css" type="text/css" rel="stylesheet" />
  	<link href="${path}/resources/css/app.css" type="text/css" rel="stylesheet" />
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  	 <form action="join.do" method="post" name="join">
  	<div class="div">
    		<div class="div1">
      			<div class="div2">
        				<img class="black-arrow-icon large-icon">
        				
        				<div class="b">가입하기</div>
        				<div></div>
        				
      			</div>
      			<div class="div3">
        				<div class="div4">
          					<div class="div5">
            						<input class="div6" name="email">이메일 등록   </input>
          					</div>
          					<div class="div5">
            						<input class="div6" name="password">비밀번호 등록   </input>
          					</div>
        				</div>
        				<input type="submit" value="회원가입"/>
        				<div class="div9">
          					<div class="div10">
            						<div class="div11">
              							<img class="v-icon" alt="" src="../../assets/black-round-check.png">
              							
              							<div class="div12">
                								<div class="div13">
                  									<div class="div14">필수</div>
                  									<div class="divider-line">
                  									</div>
                								</div>
                								<div class="div16">만 14세 이상입니다.</div>
              							</div>
            						</div>
            						<div class="div17">
              							<div class="empty-ring-check large-icon"></div>
              							
              							<div class="div18">
                								<div class="div13">
                  									<div class="div14">선택</div>
                  									<div class="divider-line">
                  									</div>
                								</div>
                								<div class="div22">마케팅 정보 수신에 동의 합니다.</div>
              							</div>
            						</div>
          					</div>
          					<div class="tode-container">
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
    		</div>
  	</div>
  </form>	
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