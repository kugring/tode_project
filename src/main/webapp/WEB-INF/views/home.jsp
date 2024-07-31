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
	<link href="${path}/resources/home/style.css" type="text/css" rel="stylesheet" />
	<link href="${path}/resources/app.css" type="text/css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/home/script.js"></script>

</head>
<body>
	<div class="div">
		<div class="div1">
			<div class="note-logo icon"></div>

		</div>
		<div class="tode-logo tode-icon"></div>

		<div class="div2">할일을 작성하고 목표를 관리해보세요</div>
		<div class="div3">
			<div class="div4">
				<div class="div5">로그인</div>
			</div>
			<div class="div6">
				<div class="div5">회원 가입</div>
			</div>
		</div>
	</div>
</body>
</html>
